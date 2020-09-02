import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  // const fitMapToMarkers = (map, markers) => {
  //   const bounds = new mapboxgl.LngLatBounds();
  //   markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  //   map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  // };
  function getSearchParameters() {
      var prmstr = window.location.search.substr(1);
      return prmstr != null && prmstr != "" ? transformToAssocArray(prmstr) : {};
  }

  function transformToAssocArray( prmstr ) {
    var params = {};
    var prmarr = prmstr.split("&");
    for ( var i = 0; i < prmarr.length; i++) {
        var tmparr = prmarr[i].split("=");
        params[tmparr[0]] = tmparr[1];
    }
    return params;
  }

  const params = getSearchParameters();

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/bright-v8',
      center: [params['lon'], params['lat']],
      zoom: 8
    });

    var geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: false
      },
      trackUserLocation: true,
      showAccuracyCircle: false,
    });

    if (params['gl'] == 'y') {
      // Add the control to the map.
      map.addControl(geolocate, 'top-left');
      map.on('load', function() {
        geolocate.trigger();
        map.flyTo({
        center: [params['lon'], params['lat']],
        zoom: 8
      });
      });

    }

    // map.flyTo({
    //   center: [params['lon'], params['lat']],
    //   zoom: 8
    // });


    // map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl, placeholder: "Search location!" }), "top-right");

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = "url('https://image.flaticon.com/icons/png/512/1789/1789848.png')";
        element.style.backgroundSize = 'contain';
        element.style.width = '50px';
        element.style.height = '50px';

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });

    // fitMapToMarkers(map, markers);

  }
};

export { initMapbox };
