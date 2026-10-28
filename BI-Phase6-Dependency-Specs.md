# BI-Phase6-Dependency-Specs.md -- Cross-distribution work for Database::BI Phase 6

Specification for every change Phase 6 (`BI-Phase6.md`) requires in the supporting
distributions.  The parent document names five: `HTML::OSM`, `Geo::Coder::Free`,
`Geo::Location::Point`, `HTML::D3`, and `HTML::Genealogy::Map`.  Each section below
gives the evidence from the installed source, the code shape, the tests, the version
bump required, and the release order so `Database::BI` can state a tight minimum.

Installed versions at the time of writing (perlbrew perl-5.40.0):

| Module              | Installed | Section |
|---------------------|-----------|---------|
| `HTML::OSM`         | 0.11      | SS1     |
| `Geo::Coder::Free`  | 0.51      | SS2     |
| `Geo::Location::Point` | 0.19   | SS3     |
| `HTML::D3`          | 0.23      | SS4     |
| `HTML::Genealogy::Map` | 0.06   | SS5     |

Line references are anchored on identifiers, not line numbers.

---

## S1 -- HTML::OSM

Three changes are needed.  Items 1 and 2 are small and independent; they should ship
together as 0.12.  Item 3 (circle markers) is its own feature and belongs in 0.13.

### S1.1 -- `search` constructor param (target: 0.12)

#### Motivation

`onload_render` unconditionally emits a Nominatim-powered search box.  The relevant
source (around `$body .= qq{<input type="text" id="search-box"...}`) shows that three
things are always added regardless of whether the caller asked for them:

1. CSS rules for `#search-box`, `#reset-button`, and `#clear-search-button`.
2. The `<input>` and `<button id="clear-search-button">` HTML elements.
3. A `var searchMarkers = [];` declaration and a `keyup` event handler that
   `fetch()`es `https://nominatim.openstreetmap.org/search` with whatever the
   user types.

For a local data-viewer that reads production CSV and SQLite files containing personal
data (staff lists, genealogy records, medical data), this is an unasked-for egress
channel: every keystroke the user types into the search box leaves the machine.
`BI-Phase6.md` SS7 classifies suppressing it as part of the feature, not a hardening
option: "Request a `search => 0` option from `HTML::OSM` (SS8) and default it off."

The `Reset Map` button is independent and must stay.  It is a purely local operation
(calls `map.setView(...)`) and is useful whether or not search is enabled.

#### Code shape

New constructor parameter:

```perl
search => { type => 'boolean', optional => 1 },
```

Default in `new()`:

```perl
search => 1,
```

Defaulting to `1` preserves backward compatibility: any existing caller that does not
pass `search =>` continues to get the search box.

**CSS** -- currently the entire style block is unconditional.  Gate the
search-related rules:

```perl
# When search => 1 (or omitted):
$head .= qq{
    <style>
        #map { width: $width; height: $height; }
        #search-box { margin: 10px; padding: 5px; }
        #reset-button, #clear-search-button { margin: 10px; padding: 5px; cursor: pointer; }
    </style>
};

# When search => 0:
$head .= qq{
    <style>
        #map { width: $width; height: $height; }
        #reset-button { margin: 10px; padding: 5px; cursor: pointer; }
    </style>
};
```

**HTML body** -- the `<input>` and "Clear search markers" button are conditional;
the "Reset Map" button is not:

```perl
if ($self->{search}) {
    $body .= qq{<input type="text" id="search-box" placeholder="Enter location">\n};
    $body .= qq{<button id="clear-search-button">Clear search markers</button>\n};
}
$body .= qq{<button id="reset-button">Reset Map</button>\n};
```

**JavaScript** -- the `searchMarkers` array and both event handlers are conditional:

```perl
if ($self->{search}) {
    $body .= qq{var searchMarkers = [];\n};
}
```

Event handlers (currently both unconditional):

```perl
# Reset button -- always emitted:
$body .= qq{
    document.getElementById('reset-button').addEventListener('click', function() {
        map.setView([$center_lat, $center_lon], $zoom);
    });
};

# Search handlers -- only when search is on:
if ($self->{search}) {
    $body .= qq{
        document.getElementById('clear-search-button').addEventListener('click', function() {
            searchMarkers.forEach(function(m) { map.removeLayer(m); });
            searchMarkers = [];
        });
        document.getElementById('search-box').addEventListener('keyup', function(event) {
            if (event.key === 'Enter') {
                var query = event.target.value.trim();
                if (!query) { alert('Please enter a valid location.'); return; }
                fetch('https://$NOMINATIM_HOST?format=json&q=' + encodeURIComponent(query))
                ...
            }
        });
    };
}
```

**API SPECIFICATION update** -- add `search` to the constructor spec table:

```
search  : boolean  (optional, default 1)
          When 0, the Nominatim search box and Clear-search button are
          omitted from onload_render output; the Reset Map button is always
          emitted.
```

**MESSAGES** -- no new messages.  The change removes emitted content; it does
not add new error states.

#### Tests (new in `t/search.t` or added to the existing `new/onload` suite)

| Subtest | Input | Assert |
|---------|-------|--------|
| Default keeps search | `HTML::OSM->new(...)` no `search` param | `<input ... id="search-box">` in body; Nominatim URL in body |
| `search => 1` keeps search | explicit | same as default |
| `search => 0` removes input | `search => 0` | `search-box` absent; `clear-search-button` absent; `nominatim.openstreetmap.org` absent in body |
| `search => 0` keeps reset | `search => 0` | `id="reset-button"` present; `map.setView` handler present |
| `search => 0` no stale var | `search => 0` | `searchMarkers` absent from JS |
| CSS pruned | `search => 0` | `#search-box` absent from `<style>` |
| Clone inherits | `$m->new(search => 0)` clone | still `search => 0` |

---

### S1.2 -- `max_zoom` constructor param (target: 0.12, bundle with S1.1)

#### Motivation

`L.tileLayer` accepts a `maxZoom` option that caps how far Leaflet lets the user
zoom in.  The default OSM tile server has tiles to zoom 19, matching the constant
`$ZOOM_MAX` (19) in the constructor.  But internal or air-gapped tile servers
commonly serve only to zoom 16 or 18.  Without `maxZoom` on the tile layer, Leaflet
allows zooming past the server's coverage; the user sees a grey grid of 404 tiles
while the map is ostensibly "working".

The current `onload_render` emits:

```javascript
L.tileLayer('...', { attribution: '...' }).addTo(map);
```

There is no way for the caller to add `maxZoom` without modifying the rendered JS.

#### Code shape

New constructor parameter, validated alongside `zoom`:

```perl
max_zoom => { type => 'integer', min => 0, max => 28, optional => 1 },
```

Range 0..28 is permissive: the OSM standard cap is 19, but specialised providers
(satellite imagery, high-resolution municipal) sometimes go higher; 28 is the
practical ceiling Leaflet supports.  No default -- when absent, `maxZoom` is not
emitted and Leaflet uses the tile provider's native limit.

In `onload_render`, compute the option string and interpolate it:

```perl
my $max_zoom_opt = defined($self->{max_zoom})
    ? ", maxZoom: $self->{max_zoom}" : '';
...
$body .= "L.tileLayer('$tile_url', { attribution: '$tile_attribution'$max_zoom_opt }).addTo(map);\n";
```

**API SPECIFICATION update** -- add `max_zoom` to the constructor spec table:

```
max_zoom : integer  0..28  (optional, no default)
           Sets maxZoom on the tile layer.  When absent, Leaflet uses the
           tile provider's native limit.  Useful when tile_url points at
           an internal server with limited zoom coverage.
```

**MESSAGES** -- no new messages.  Validation errors come from
`Params::Validate::Strict` as with `zoom`.

#### Tests

| Subtest | Input | Assert |
|---------|-------|--------|
| Absent -- no option emitted | no `max_zoom` | `maxZoom` absent from `L.tileLayer(...)` call |
| `max_zoom => 16` | explicit | `maxZoom: 16` present in `L.tileLayer` options |
| `max_zoom => 0` | zero | `maxZoom: 0` present (zero is a legal value) |
| `max_zoom => 19` | matches ZOOM_MAX | `maxZoom: 19` present |
| `max_zoom => 28` | ceiling | accepted without error |
| `max_zoom => 29` | out of range | `Params::Validate::Strict` validation error |
| Clone inherits | `$m->new(max_zoom => 16)` clone | `maxZoom: 16` in output |

---

### S1.3 -- Circle / bubble markers via `add_circle_marker` (target: 0.13)

#### Motivation

`BI-Phase6.md` SS2 lists `size=<col>` as a map option that drives a bubble radius.
`L.marker` places a pin icon; its apparent size is fixed and carries no quantitative
meaning.  `L.circleMarker` places a filled circle whose pixel radius is set at draw
time, making it the right primitive for "area encodes a measure".

`L.circleMarker` differs from `L.circle` in one important way: `circleMarker` uses
screen pixels for its radius, so every bubble stays the same size as the user zooms
in or out.  `L.circle` uses geographic metres, so the circle grows and shrinks with
zoom.  For an analytical bubble map -- "how large is this city relative to others?"
-- screen-pixel radius is what we want.

The current `add_marker` method only stores `[$lat, $lon, $label, $icon_url]`
(`coordinates` arrayref, line `push @{$self->{coordinates}}, ...`).  It has no
radius or colour concept.  Adding `radius` to the existing method would change its
storage tuple and break the `onload_render` path for ordinary pin markers.  A
separate method is the clean cut.

#### Code shape

**New method `add_circle_marker`:**

```perl
$map->add_circle_marker([51.5074, -0.1278],
    html   => 'London',
    radius => 12,
    colour => '#e45c3a',
);
```

**Input spec (API SPECIFICATION section):**

```
point  : arrayref [lat, lon] | object with latitude()/longitude()   (required)
html   : string   (optional popup label)
radius : number > 0   (optional, default 8)
colour : string   hex #rrggbb or #rgb, case-insensitive   (optional, default '#3388ff')
```

`#3388ff` is Leaflet's default path colour; using it as the fallback means a circle
marker with no explicit colour blends with the rest of a Leaflet-default map.

Returns `1` on success, `0` if the point cannot be validated (same contract as
`add_marker`).

**Storage** -- a new parallel list, not `$self->{coordinates}`:

```perl
$self->{circle_markers} //= [];
push @{$self->{circle_markers}}, [$lat, $lon, $html, $radius, $colour];
```

Keeping circle markers separate preserves the existing `onload_render` loop over
`$coordinates` without retrofitting a type discriminator into every tuple.

**Validation:**

- `radius`: must be a positive number.  `0` and negative values croak with
  `'add_circle_marker(): radius must be positive'`.
- `colour`: must match `/\A#(?:[0-9a-fA-F]{3}|[0-9a-fA-F]{6})\z/`.  Named CSS
  colours are not accepted (they require a separate lookup table or browser
  resolution and introduce an encoding ambiguity in the JS output).  Invalid values
  croak with `'add_circle_marker(): invalid colour: VALUE'`.
- Normalise `colour` to lowercase before storage so the JS output is canonical.

**`onload_render` changes:**

1. The "no data" guard must include circle markers:

   ```perl
   unless (@$coordinates || @$geojson_layers || @$heatmap_layers
                        || @$gpx_tracks     || @$choropleth_layers
                        || @{$self->{circle_markers} // []}) {
       croak 'No map data provided';
   }
   ```

2. A new loop after the pin-marker loop:

   ```perl
   for my $cm (@{$circle_markers}) {
       my ($lat, $lon, $html, $radius, $colour) = @$cm;
       my $js_label   = _js_string($html // '');
       my $js_colour  = _js_string($colour);
       my $bind       = length($html // '') ? ".bindPopup('$js_label')" : '';
       my $marker_js  = "L.circleMarker([$lat, $lon], "
           . "{ radius: $radius, color: '$js_colour', "
           . "fillColor: '$js_colour', fillOpacity: 0.7 })$bind";
       if ($self->{cluster}) {
           $body .= "\t\t\tclusterGroup.addLayer($marker_js);\n";
       } else {
           $body .= "\t\t\t$marker_js.addTo(map);\n";
       }
   }
   ```

   The loop runs after pin markers so mixed maps (pin + circle) work in any
   proportion.  The cluster group is shared: both marker types feed the same
   `L.markerClusterGroup`, so density-based clustering works across both types.

3. Bounds auto-fit -- the centre-computation loop currently only looks at
   `@valid_coordinates` (pin markers).  When only circle markers are present and
   no `center()` was called, the map would croak.  Extend the loop:

   ```perl
   for my $cm (@$circle_markers) {
       my ($lat, $lon) = @$cm;
       $min_lat = $lat if $lat < $min_lat;
       $max_lat = $lat if $lat > $max_lat;
       $min_lon = $lon if $lon < $min_lon;
       $max_lon = $lon if $lon > $max_lon;
   }
   ```

   Run this after the existing pin-marker bounds loop, before the midpoint
   computation.  The `croak 'center() must be called when no point markers are
   provided'` is reached only when both lists are empty, which the "no data" guard
   already prevents.

**MESSAGES:**

```
'add_circle_marker(): radius must be positive'  -- radius <= 0
'add_circle_marker(): invalid colour: VALUE'    -- hex check fails
```

**API SPECIFICATION section (new =head2 add_circle_marker):**

```
=head2 add_circle_marker

Add a circle marker whose pixel radius encodes a quantitative value.

    $map->add_circle_marker([51.5, -0.1], html => 'London',
                            radius => 12, colour => '#e45c3a');

=head3 API SPECIFICATION

=head4 INPUT

  point  : arrayref [lat, lon] | object with latitude()/longitude()
  html   : string   (optional popup label)
  radius : number > 0   (optional, default 8)
  colour : string   hex #rrggbb or #rgb   (optional, default '#3388ff')

=head4 OUTPUT

  { type => integer, enum => [0, 1] }
  1 on success; 0 if the point cannot be validated.

=head3 MESSAGES

  | add_circle_marker(): radius must be positive | radius is 0 or negative |
  | add_circle_marker(): invalid colour: VALUE   | colour is not a hex string |

=head3 EXAMPLES

    # Bubble whose area encodes population
    $map->add_circle_marker([$lat, $lon],
        html   => "$city ($pop)",
        radius => sqrt($pop / $MAX_POP) * 30,
        colour => '#e45c3a',
    );

    # Mixed map: pin markers for offices, circles for market size
    $map->add_marker(   [$lat1, $lon1], html => 'HQ');
    $map->add_circle_marker([$lat2, $lon2], html => 'Market A', radius => 20);
```

#### Tests (new `t/circle_marker.t` or added to the existing marker suite)

| Subtest | Input | Assert |
|---------|-------|--------|
| Basic circle | `add_circle_marker([51.5, -0.1], ...)` | `L.circleMarker([51.5, -0.1], { radius: 8, ...})` in body |
| Custom radius | `radius => 20` | `radius: 20` in JS options |
| Custom colour | `colour => '#ff0000'` | `color: '#ff0000', fillColor: '#ff0000'` in JS |
| #rgb shorthand | `colour => '#f00'` | hex accepted; normalised to lowercase |
| Uppercase hex accepted | `colour => '#FF0000'` | normalised to `#ff0000` in JS |
| Named colour rejected | `colour => 'red'` | croaks with invalid-colour message |
| Zero radius | `radius => 0` | croaks with radius-positive message |
| Negative radius | `radius => -5` | croaks |
| Default radius | no `radius` | `radius: 8` in JS |
| Default colour | no `colour` | `color: '#3388ff'` in JS |
| No popup | no `html` | no `.bindPopup(...)` in emitted JS |
| With cluster | `HTML::OSM->new(cluster => 1)` + circle | `clusterGroup.addLayer(L.circleMarker(...))` |
| Without cluster | default | `L.circleMarker(...).addTo(map)` |
| Mixed with pin | `add_marker` + `add_circle_marker` | both types in body; only one cluster group |
| Circle-only map | only `add_circle_marker` calls | renders without error; no croak |
| Bounds from circles | circle-only, no `center()` call | centre computed from circle coords |
| Return value | valid point | returns 1 |
| Bad coords | `[200, 0]` | returns 0, no croak |

---

### S1.4 -- Release order and minimum version changes in Database::BI

| HTML::OSM release | New features | Database::BI minimum bump | Work gated on this |
|---|---|---|---|
| 0.12 | `search => 0`, `max_zoom` | `HTML::OSM => 0.12` | `_map_data` adds `search => 0` to `HTML::OSM->new(...)` unconditionally (not version-gated — 0.12 becomes the floor); `map_view` gains `?zoom=` URL param mapped to `$map->zoom(N)`; `map_view` gains `?max_zoom=` from config or URL |
| 0.13 | `add_circle_marker` | `HTML::OSM => 0.13` | `map_view` gains `?size=<col>` URL param; `_map_data` calls `add_circle_marker` when `size=` is set |

**`_map_data` change for `search => 0` (after bump to 0.12):**

```perl
my $map = HTML::OSM->new(
    height  => '560px',
    width   => '100%',
    cluster => 1,
    search  => 0,           # suppress Nominatim egress by default
    ($tile_url && $native_tile_url ? (tile_url => $tile_url) : ()),
    %leaflet_assets,
);
```

No version guard needed once 0.12 is the minimum.

**`CLAUDE.md` update** -- bump the HTML::OSM minimum from 0.10 to 0.12 in the
"Runtime deps" paragraph, and add `search`, `max_zoom`, `zoom=`, and `size=` to the
`/map` route documentation.

---

## S2 -- Geo::Coder::Free

**Status: no new changes required.**

`Database::BI::Model::Geocode` requires `Geo::Coder::Free` >= 0.47 (constant
`$MIN_GEOCODER_VERSION` in `Geocode.pm`).  The installed version is 0.51, and the
interface it asks for was introduced as follows:

| Version | Feature | Used by Geocode.pm |
|---|---|---|
| 0.46 | `valid_location($value)` | SS17 of the caller loop: skip bare numbers and empty strings without asking the geocoder |
| 0.46 | `on_error => 'undef'` | passed at construction time so a failed lookup returns `undef` rather than dying |
| 0.47 | `geocode_many(\@values, %opts)` | batch lookup of distinct values in one call; the method the stub in `t/map.t` implements |

All three are present in 0.51.  No cross-dist work is required.

**Note for the warming script (item 6.3):** `script/bi-geocode` will call
`Geo::Coder::Free->new(...)` and `geocode_many` directly; it inherits the same
0.47 minimum.

---

## S3 -- Geo::Location::Point

**Status: no new changes required.**

`Geocode.pm` uses three methods on the point object that `geocode_many` returns:

| Method | Purpose | Present in 0.19 |
|---|---|---|
| `->latitude()` | extract latitude | yes |
| `->longitude()` | extract longitude | yes |
| `->database()` | name the backend that resolved the point (e.g. `'OpenAddresses'`) | yes |

All three are confirmed present (verified above).  No cross-dist work is required.

---

## S4 -- HTML::D3

**Status: no new changes required for Phase 6.**

Phase 6 adds a map view; it does not add a new chart type.  HTML::D3 0.23 is
installed; the Database::BI minimum is 0.20 (required for `radius_range` in
`scatter_view`).  No HTML::D3 method is called from `map_view` or `_map_data`.

The section exists in this document because `BI-Phase6.md` SS8 names HTML::D3 in
the list of cross-dist companions.  The rationale is consistency: a future palette
addition to HTML::D3 (so `scheme=` names work across chart and map types) may be
specified here rather than in a separate document.  Nothing is needed now.

---

## S5 -- HTML::Genealogy::Map

**Status: a pattern to avoid, not a change to make.**

`HTML::Genealogy::Map` 0.06 is installed.  `BI-Phase6.md` SS3 notes that it
`sleep(1)`s between geocode calls to be polite to remote providers:

```perl
# In HTML::Genealogy::Map -- illustrative; do not copy
sleep(1) if $self->{throttle};
```

`Database::BI::Model::Geocode` uses `Geo::Coder::Free`, which is a local SQLite
geocoder.  A local lookup needs no throttle: adding a `sleep` here would make a
500-place warm take eight minutes for no benefit.  This is documented as a
deliberate divergence, not an oversight.

If a remote geocoder is ever plugged in (not the current design; `BI-Phase6.md` SS13
explicitly rules out remote geocoding services), the throttle must go into a wrapper
object or a `UA`-level middleware, not a `sleep` in `Geocode.pm`.

No code changes are required in `HTML::Genealogy::Map` itself.

---

## Appendix: verification checklist before each HTML::OSM release

These are the tests in HTML::OSM's own suite that must stay green, plus the new ones:

**Before 0.12:**

1. Existing `t/` suite green (no regressions to `cluster`, `tile_url`, `zoom`, etc.).
2. `search => 0` removes the three search-related elements from body and JS.
3. `search => 0` keeps reset button and `map.setView` handler.
4. `max_zoom => N` emits `maxZoom: N` in the `L.tileLayer` call.
5. `max_zoom => 29` throws a validation error.
6. With both `search => 0` and `max_zoom => 16`: both effects present, no interaction.

**Before 0.13:**

1. Existing 0.12 suite green.
2. `add_circle_marker` basic case: `L.circleMarker` in output, correct radius and colour.
3. `add_circle_marker` with cluster: `clusterGroup.addLayer(...)`.
4. Circle-only map renders without the "No map data provided" croak.
5. Centre auto-computed from circle marker bounds when no `center()` call.
6. Mixed pin + circle: both types in body; only one cluster group.
7. Invalid colour and zero/negative radius croak with the right messages.

**After bumping Database::BI's minimum to 0.12:**

1. Full `prove -lr t/` green (all 1,855+ tests).
2. `search-box` absent from every map page rendered by `_map_data` (the search box
   is always suppressed at the app level).
3. `t/map.t` subtest "Leaflet assets and tiles can be self-hosted for an offline
   deployment" passes (it already passes with 0.11; confirm it still passes with
   the 0.12 code path).

**After bumping Database::BI's minimum to 0.13:**

1. Full `prove -lr t/` green.
2. `t/map.t` (or a new `t/map_bubble.t`) tests `?size=<col>` producing
   `L.circleMarker` in the body with the correct radius derived from the column value.
