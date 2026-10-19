# BI-Phase6.md — Implementation specification: `Database::BI` Phase 6 (geography)

Specification for **Phase 6** of `BI-ROADMAP.md` (workspace root), a new phase not yet in that
document: a **map view** built on `HTML::OSM`, plotting either coordinate columns or a
location column geocoded locally with `Geo::Coder::Free`. Items 6.1–6.5, plus the
cross-dist work §8 asks of `HTML::OSM`.

- **Target dist:** `Database::BI`.
- **Version:** if implemented next, the next minor after 0.012.x (proposal `0.013.0`); if the
  phase documents 3–5 are built first, the next minor after Phase 5 (proposal `0.019.0`).
- **Hard prerequisite:** none from Phases 3–5. Everything this phase needs already ships:
  the per-dataset model store (`.bi/models.json`, `_calc_models_path`, `Dashboard.pm:1395`),
  the pipeline entry point (`_run_pipeline_source`, `Dashboard.pm:1181`), calculated fields
  and date normalisation (`_apply_calc_fields`, `Dashboard.pm:1286`), filters (`f=`), the
  chart-spec vocabulary, and the chart-page template shape (`scatter.html.tt`). **This phase
  can therefore ship before Phases 3–5**; only the optional 6.5 overlay overlaps with 3.1.
- **New dependencies:** `HTML::OSM` (≥ 0.10) and `Geo::Coder::Free` (≥ 0.43) — both
  **optional**, added as `recommends` and loaded with a runtime `require`, never as hard
  `PREREQ_PM` entries. Unlike Phase 5, **this phase adds no service and no network
  dependency**: `Geo::Coder::Free` is deliberately a local-SQLite geocoder, and that choice
  is the design. See §7.
- **Line references:** dated 2026-10-15 anchors; anchor on sub names, not line numbers.

---

## 1. Why a map is a different kind of visual

Every mark in Phase 2 plots measure against dimension. A map plots **position**, and position
arrives in one of two shapes:

1. **Coordinates are already in the data** — two numeric columns (latitude and longitude, or
   `x`/`y` eastings/northings), or one text column holding `"51.5074, -0.1278"`.
2. **Coordinates are implied by a location** — a column of place names or addresses
   (`"Ramsgate, Kent, UK"`, `"1600 Pennsylvania Avenue NW, Washington DC"`) that must be
   resolved to a point first.

Shape 1 is rendering. Shape 2 is a **lookup with a cache, a cost and a privacy consequence**,
and it is the reason this phase is not simply "one more chart". Both shapes must share one
route, one template and one visual spec; only the resolution step differs.

The rule that keeps shape 2 honest: **coordinates are resolved in Perl, then handed to
`HTML::OSM` as numbers.** `HTML::OSM::_fetch_coordinates` treats a *string* point as either
an injected-geocoder call or a live HTTP request to `nominatim.openstreetmap.org`
(`HTML/OSM.pm:1063`). Passing an address through would silently make the web app's responses
depend on a third-party rate-limited service, and would bypass our cache. Never do it.

---

## 2. Item 6.1 — `/map`: the map from coordinate columns

A new chart route and template, structurally identical to `scatter_view`
(`Dashboard.pm:4879`) and `templates/web/en/scatter.html.tt`:

- Run the normal pipeline: `_run_pipeline_source` → `_apply_calc_fields` → `every_param('f')`
  filters. A map must show the *filtered, calculated* view, not the raw table — otherwise it
  contradicts the table the user came from. This is roadmap item 0.1's lesson again: filters
  applied after rendering are a correctness bug.
- **Parameters** (repeatable where the existing routes are repeatable):

  | Param | Meaning |
  |---|---|
  | `lat=`, `lon=` | the two coordinate columns (required unless `loc=` is given) |
  | `loc=` | a location column to geocode instead (6.2) |
  | `popup=` | column(s) shown in the marker popup (repeatable, default: all non-coordinate columns, truncated) |
  | `agg=` | `count` (default) \| `none` \| `sum:<col>` \| `avg:<col>` — how rows sharing a coordinate are combined |
  | `size=` | numeric column controlling marker radius (bubble map; needs §8) |
  | `series=` + `scheme=` | colour markers by a category column using the existing `%SCATTER_SCHEMES` (`Dashboard.pm:110`) |
  | `heat=1`, `weight=` | heatmap layer, intensity from a numeric column |
  | `cluster=1` | group markers with `leaflet.markercluster` |
  | `zoom=`, `tiles=` | zoom level; `tiles=` names a tile source from config, never a URL |
  | `max=` | marker cap for this request (default `map_max_markers`, 6.4) |
  | `back=`, `back2=`, `back2_label=` | as everywhere else |

- **Column detection.** Auto-detect candidates so the panel can preselect them, but never
  silently: name match (`lat`, `latitude`, `lon`, `lng`, `long`, `longitude`, `x`/`y` only
  when the values are in range) **and** value range (latitude −90…90, longitude −180…180,
  numeric, not constant, at least two distinct values). A name that matches but whose values
  are out of range is a **400 with a named column** (`error_map_lat_range`), not an empty map:
  a transposed lat/lon pair is the single most likely user error here, and it must be
  diagnosable from the message.
- **Per-row handling.** Non-numeric, empty or out-of-range coordinates are skipped, counted,
  and reported on the page ("plotting N of M rows; K rows have no usable coordinate"). Rows
  are never plotted at (0,0) — a fake point in the Gulf of Guinea is worse than a missing one.
- **Marker aggregation is the default** (`agg=count`), as in the in-workspace precedent
  `HTML::Genealogy::Map` (`lib/HTML/Genealogy/Map.pm`, which groups events on
  `sprintf('%.6f,%.6f', $lat, $lon)`): rows at the same coordinate become one marker whose
  popup lists the count and the aggregated measure. This is what makes a 100k-row file
  renderable, and it is the correct semantic for "how many of these are there?".
- **Template.** New `templates/web/en/map.html.tt` modelled on `scatter.html.tt` (back links,
  title, source attribution via `_url_attribution`, i18n through `_resolve_template`).
  `HTML::OSM::onload_render` returns **two** strings — a head part (Leaflet CSS/JS) and a body
  part. Add a single `extra_head` slot to `templates/web/en/layouts/default.html.tt` before
  `</head>` (line 1226) and stash it; do not duplicate Leaflet's `<link>`/`<script>` into the
  body of a page whose layout already owns the head.
- The map inherits the app's look: wrap the map `<div>` in the existing panel styling, and
  keep `HTML::OSM`'s body markup (search box, reset buttons) inside that wrapper rather than
  letting it float over the page.
- **Acceptance:** a fixture with known coordinates renders one marker per distinct point with
  the right popup counts; transposing the columns produces the range error, not a wrong map;
  a file with no coordinate columns produces a 400 naming what was expected.

---

## 3. Item 6.2 — geocoding a location column with `Geo::Coder::Free`

When a dataset has no coordinates but has places, offer `loc=<column>` and resolve the
distinct values locally:

```
my $geo = Geo::Coder::Free->new(($openaddr ? (openaddr => $openaddr) : ()));
my $pt  = $geo->geocode(location => $place, ($region ? (region => $region) : ()));
# $pt is a Geo::Location::Point (lat/latitude, long/lng/longitude, distance) or undef
```

- **Distinct values only, one lookup each**, cached (6.3). A location column in a log file
  repeats the same handful of strings thousands of times; geocoding per row is a defect.
- **Bounded per request.** Cap new lookups at `map_geocode_max` (default 500, configurable);
  when the cap binds, plot what resolved, cache what was attempted, and say so on the page
  ("geocoded 500 of 1,240 new places; open the data source again or run the warm script to
  finish"). Never let a crafted URL turn one request into unbounded CPU.
- **No `sleep`.** `HTML::Genealogy::Map` sleep(1)s between geocodes to be polite to *remote*
  providers; a local SQLite lookup needs no throttling, and copying that sleep here would
  make a 500-place warm take eight minutes for nothing. If a *remote* geocoder is ever added
  (it is not, by default — §7), it must go through a throttled UA, not a sleep.
- **Backend provenance matters.** `Geo::Coder::Free` dispatches to OpenAddresses / Local /
  MaxMind depending on whether `openaddr`/`OPENADDR_HOME` data is installed
  (`Geo/Coder/Free.pm` DESCRIPTION); MaxMind alone is coarse for street addresses. Record and
  display **which backend resolved each point**, and tell the user when the geocoder is
  running without openaddr data rather than quietly plotting city centroids. Unresolved
  values are recorded as attempted-and-failed so they are not retried on every request.
- **`region` hint.** Pass a two-letter country as `region` when configured; it materially
  improves ambiguous place names ("Springfield", "Richmond") and costs nothing. Take it from
  an explicit `map_region` config value, optionally defaulted from
  `CGI::Lingua->country()` (`CGI/Lingua.pm:1829`) — note that the app today resolves only a
  *language* via `_resolve_language` (`Dashboard.pm:288`), and language is not country, so
  treating a language code as a region hint would be a bug.
- **Coordinates handed over as numbers.** `$map->add_marker([$lat, $lon], html => $popup)`.
  `Geo::Location::Point` also satisfies `HTML::OSM`'s object path (`latitude()`/`longitude()`),
  so passing the point object directly is legal — but converting to `[lat, lon]` once, in one
  place, keeps the "no addresses reach the renderer" rule auditable.
- **Missing module is a first-class state.** If `Geo::Coder::Free` cannot be loaded, the panel
  hides the location option and the route answers with `error_map_geocoder_missing` naming the
  module; the map from explicit coordinates keeps working. The app must install, start and
  test without either new module present.

---

## 4. Item 6.3 — the geocode cache (and warming it)

Two layers, both already precedented in this codebase:

1. **Persistent, per dataset, in the model store** — extend `.bi/models.json` alongside
   `fields`, `groups` and `date_patterns` (read/write via `_read_models`/`_write_models`,
   `Dashboard.pm:1425`/`1440`), keyed by the same `l=` spec string the other sections use:

   ```
   geo => {
     <l-spec> => {
       columns => { <col> => { kind => 'lat' | 'lon' | 'location' } },
       places  => { <location-col> => { <raw value> => [lat, lon] | 0 } },   # 0 = tried, unresolved
       backend => 'OpenAddresses' | 'MaxMind' | …,
       built   => ISO-8601,
     }
   }
   ```

   This is the file that makes the feature usable a second time, and it inherits the existing
   safety guard: `_calc_models_path` refuses to write when `model_dir` is inside `data_dir`.
   The cache must obey the same rule and, when it is unwritable, **degrade to in-memory
   per-request geocoding with a visible message** — never to a failure, and never to a write
   inside the user's data directory.
2. **Process cache** — reuse the existing `CHI` dependency for the request (the pipeline's
   `Database::BI::Model::DataSource` already accepts a `cache` object,
   `Model/DataSource.pm:348`); do not add a second caching mechanism or a new dependency.

**CRUD route set** mirroring the date-pattern endpoints (`/dates/list`, `POST /dates/save`,
`POST /dates/delete`, `Dashboard.pm:4819`–`4866`): `GET /geo/list`, `POST /geo/save`,
`POST /geo/delete`. Same shape, same `l=` key, same JSON responses.

**Warming script.** Phase 4.3 establishes the CLI precedent (`script/database-bi` exists; a
`script/` CLI is how background work reaches this app without a daemon). Add a
`--geocode-warm` mode (or `script/bi-geocode`) that opens one dataset spec, geocodes every
distinct value of the named column, and reports resolved / unresolved / elapsed. This is the
answer to the cap in 6.2: the interactive path plots what it can immediately, and the script
does the long tail offline. It must be idempotent (a second run does no lookups) and must
print a summary suitable for cron.

---

## 5. Item 6.4 — layers and options

`HTML::OSM` 0.10 already supports the three layer types this phase needs; use them rather
than hand-emitting Leaflet:

| Feature | Mechanism | Status |
|---|---|---|
| One marker per aggregated point, HTML popup | `add_marker([lat, lon], html => $html)` | in 0.10 |
| Dense data | `cluster => 1` (markercluster plugin) | in 0.10 |
| Density / intensity by measure | `add_heatmap(\@points, radius => , blur => )`, points `[lat, lon, intensity]` with intensity normalised to 0…1 | in 0.10 |
| Fit the view to the data | automatic from marker bounds; `center`/`zoom` override | in 0.10 |
| Bubble map by measure (`size=`) | needs circle markers — §8 | **§8** |
| Colour by category (`series=`, `scheme=`) | needs per-marker colour — §8 | **§8** |

- **Popup content is server-rendered and escaped.** Build the popup HTML in Perl from the
  selected columns (reusing `_decode_cell`, `Dashboard.pm:1510`) and escape every value;
  marker labels become JavaScript string literals inside `onload_render`, so an unescaped
  quote in a customer name is a script-injection path. Add a fixture with `'`, `"`, `<` and
  `</script>` in a popup column and assert the page still parses.
- **Cap and aggregate, then message.** `map_max_markers` (default 2,000, mirroring
  `MAX_PER_PAGE`, `Dashboard.pm:109`) applies *after* aggregation; when it binds, plot the
  largest groups and state how many were omitted, with a count of what was dropped. A map
  that silently shows 1% of the points is a lie; a map that says "showing 2,000 of 12,431
  groups" is a tool.
- **Tiles.** `tiles=` selects a *named* source from config (default: OpenStreetMap). It must
  never accept an arbitrary URL, or a shared link could make a recipient's browser request
  tiles from a host of the sender's choosing. Document that the default tiles require
  internet access from the browser, and that the OSM tile policy expects attribution (which
  `HTML::OSM` emits) and forbids heavy automated use — for a multi-user or air-gapped
  deployment, point `tiles=` at an internal tile server (§7).
- **Export.** A Leaflet map is DOM, not SVG, so the `Export SVG/PNG` pattern of the D3 charts
  does **not** transfer (rasterising it needs html2canvas and would pull tile pixels through
  a canvas). Ship a "Copy link" button and the shareable URL, and defer image export to Phase
  3.7's print stylesheet; state this on the page rather than offering a broken button.

---

## 6. Item 6.5 — optional overlay of boundary data

`HTML::OSM` supports `add_geojson` and `add_choropleth` (colours pre-computed in Perl). A
useful, cheap extension: `gj=<spec>` opens a GeoJSON file through the existing `_open_spec`
machinery and overlays it, and `gj=<spec>&gk=name&gv=<measure>` feeds `add_choropleth` to
shade regions by an aggregated measure (the `values` hashref keyed by the GeoJSON feature
property).

- This is **optional** and explicitly lower priority than 6.1–6.4: it is the only item that
  needs a second dataset and a join key, and it is the only one that overlaps Phase 3.1.
- A `choropleth`-only map has no markers, so `center`/`zoom` must be supplied (the HTML::OSM
  POD is explicit that `onload_render` croaks without either).
- Do not build a boundary-data downloader. If the user has no GeoJSON file, the feature is
  simply absent — acquiring boundary data is a data problem, not a rendering one.

---

## 7. Privacy, egress and the offline posture (cross-cutting)

This is the phase where a file viewer can accidentally become a data-exfiltration tool, so the
rules are part of the feature, not a note:

- **No addresses leave the machine** for geocoding: `Geo::Coder::Free` is local SQLite by
  design ("deliberately avoids paid or rate-limited online geocoding services"). This is the
  reason it is chosen over Nominatim, Google or Geoapify, and it should be stated in the POD
  and the panel description. A location column in a personal or genealogical dataset is
  personal data.
- **Do not log location values at info level.** Log counts and the dataset spec, not the
  strings. The existing `%MESSAGES`-style diagnostics (`Dashboard.pm:67`) carry no data.
- **The browser still makes two outbound requests** and both must be documented and
  configurable:
  1. **Tiles** from `openstreetmap.org` unless `tiles=` points elsewhere.
  2. **Leaflet itself** from `unpkg.com` — `HTML::OSM` pins `js_url`/`css_url`/`heatmap_js_url`
     to CDNs but accepts overrides, so expose them via app config for offline/air-gapped
     deployments.
- **The in-page Nominatim search box must be switchable off.** `onload_render` currently
  always emits it and its handler `fetch()`es `https://nominatim.openstreetmap.org/search`
  from the browser with whatever the user types (`HTML/OSM.pm:989`). For a local tool that
  reads production files, an always-on third-party search box is an egress channel we did not
  ask for. Request a `search => 0` option from `HTML::OSM` (§8) and default it off.
- **No write to `data_dir`, ever.** The geocode cache lives in `model_dir`, not beside the
  CSV, and the Phase 4.1/Phase 3 invariant is unchanged: deleting the cache loses nothing but
  time.

---

## 8. Cross-dist work required in `HTML::OSM`

The companion document `BI-Phase6-Dependency-Specs.md` (in the workspace root, beside
`BI-ROADMAP.md`) specifies every change this phase needs in the supporting distributions —
`HTML::OSM`, `Geo::Coder::Free`, `Geo::Location::Point`, `HTML::D3` and
`HTML::Genealogy::Map` — with the evidence, the code shape, the tests and the release order.
Items 1–4 below are its §1; the geocoder changes Phase 6 also depends on are its §2–§4.

Following the roadmap's precedent of naming cross-dist dependencies explicitly
("HTML::D3 may need small stacked-bar work"), this phase needs `HTML::OSM` 0.11 to expose:

1. **`search => 0`** — suppress the built-in Nominatim search box (privacy, §7).
2. **`tile_url`, `attribution`, `max_zoom`** — the tile layer is currently hardcoded to
   `https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png` with a fixed attribution
   (`HTML/OSM.pm:879`); an internal tile server or an air-gapped deployment is impossible
   without this.
3. **Circle/bubble markers** — `radius` (and optionally `colour`) on `add_marker`, emitted as
   `L.circleMarker`, or an `add_circle_marker` method. Needed for `size=` (6.4); without it,
   drop `size=` from v1 and ship markers + heatmap + cluster.
4. **Per-marker colour** — for `series=`/`scheme=`. A `colour` option emitting a `L.divIcon`
   (or `circleMarker`) is the small change; reusing `HTML::D3`'s existing palette names keeps
   `scheme=` consistent across chart types.

Items 1–2 are small and should be done with or before 6.1; 3–4 are what turn a marker map into
an analytical map and may land as 6.4's second half. `HTML::OSM`'s own test suite already
covers per-layer rendering, so each addition needs its own `t/` case there and a version bump
this dist can require.

---

## 9. Guardrails (carried from `BI-ROADMAP.md` §5–6)

- **The Perl floor.** The app must start, test and map from explicit coordinates with neither
  new module installed. Geocoding is additive and removable.
- **The URL remains the API.** Every map is a link a human could type; no map state lives only
  in JavaScript.
- **Read-only.** The map reads files and writes only to `model_dir` (the geocode cache).
- **No new service dependency.** Coordinates are resolved locally; the only network traffic is
  the browser fetching tiles and Leaflet assets, both documented and configurable.

---

## 10. URL contract additions (document in `Changes`; the URL is the real API)

| Route | Purpose |
|---|---|
| `GET /map?l=&j=&c=&f=&lat=&lon=` | map from coordinate columns (6.1) |
| `GET /map?...&loc=<column>` | map from a geocoded location column (6.2) |
| `GET /map?...&heat=1&weight=<col>&cluster=1&size=<col>&series=<col>&scheme=&tiles=&zoom=&max=` | layer options (6.4) |
| `GET /map?...&gj=<spec>&gk=&gv=` | boundary overlay (6.5) |
| `GET /geo/list`, `POST /geo/save`, `POST /geo/delete` | saved location/coordinate columns (6.3) |
| CLI `script/database-bi --geocode-warm` (name TBD) | offline geocode warming (6.3) |

A changed parameter name is a breaking change in `Changes`, as with every other route.

---

## 11. i18n and tests

- New `%MESSAGES` keys: `error_map_lat_range` (column is not a latitude/longitude),
  `error_map_no_coords` (no coordinate or location column), `error_map_geocoder_missing`,
  `error_map_loc_column` (location column not in the view), `warn_map_rows_skipped`,
  `warn_map_markers_capped`, `warn_map_geocode_capped`, `warn_map_geocoder_unavailable_data`
  (running without openaddr data), `warn_map_cache_unwritable`, `error_map_tiles_unknown`.
- New tests, all **hermetic — no network, no live geocoder**:
  - `t/map.t` — column auto-detection (name and range tables), range rejection with the right
    message, aggregation/`agg=` semantics, marker cap message, popup escaping fixture,
    missing-module path (`Test::Without::Module` is already a test dependency, as used to
    prove optional-module degradation).
  - `t/geocode.t` — inject a **stub geocoder object** (`can('geocode')`, returning a
    `Geo::Location::Point`-ish object) to test distinct-value de-duplication, cache hit/miss,
    attempted-and-unresolved not being retried, the `map_geocode_max` cap, and the
    read-only/unwritable `model_dir` degradation. `Test::Needs 'Geo::Coder::Free'` guards the
    one test that needs the real module — an unconditional dependency here would skip forever
    on CI.
  - Additions to `t/integration.t` — `GET /map` via `Test::Mojo` returns 200 with the expected
    marker coordinates in the body; `/geo/save` → `/map` round-trip; source attribution and
    `back=` links present.
  - Fixed `plan tests => N` updated in every touched file.
- Keep the whole suite green with neither `HTML::OSM` nor `Geo::Coder::Free` installed.

---

## 12. Verification checklist

1. `prove -lr t/` green from the 0.012.x baseline, with and without the two new modules
   installed.
2. A fixture with a known coordinate column renders markers at exactly those coordinates
   (assert the emitted JS, not the pixels).
3. Transposed lat/lon and an out-of-range column produce named 400s, never a plausible but
   wrong map.
4. A location-column dataset geocodes once per distinct value: assert lookup counts against a
   stub geocoder, then assert the second request performs **zero** lookups.
5. Delete the geocode cache → the map still renders (slower) and the app is otherwise
   unchanged; `data_dir` mtimes are untouched by a full map/geocode cycle.
6. Popup columns containing `'`, `"`, `<`, `</script>` do not break the page.
7. Inspect the rendered page: no address or location string appears in logs, and the search
   box is absent (or explicitly enabled by config).

---

## 13. Out of scope for Phase 6 (explicitly)

- **Turn-by-turn routing, GPX tracks, street-view or elevation.** `HTML::OSM` declares routing
  out of scope; so does this phase.
- **Reverse geocoding** (point → address). Nothing in the map view needs it; adding it would
  introduce the egress 6.2 is designed to avoid.
- **Remote geocoding services** — Google, Nominatim, Geoapify, Postcodes. If a user wants
  higher street-level accuracy, the answer is installing openaddr data locally
  (`OPENADDR_HOME`), not calling a third party.
- **Boundary/administrative data acquisition** (6.5 consumes GeoJSON; it never downloads it).
- **A GIS.** No projections, no shapefile/GeoPackage/CAD import, no spatial joins or
  distance measures — this is a map view over a table, not a spatial database.
- **Server-side map image rendering** for export (a headless-tile-render dependency), for the
  same reason Phase 3.7 keeps server-side PDF optional.
