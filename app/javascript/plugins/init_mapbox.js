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

    if (params['address'] && params['address'].length > 1) {
      const publicKey = document.querySelector("meta[name='mapbox-api-key']")
      .content;
      const address = params['address'];
      const newAddress = address.replace('+','%20');
      fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${newAddress}.json?access_token=${publicKey}`)
        .then(response => response.json())
        .then((data) => {
          const lat = data['features'][0]['center'][1];
          const lon = data['features'][0]['center'][0];
          const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/bright-v8',
            center: [lon, lat],
            zoom: 9
          });

          const markers = JSON.parse(mapElement.dataset.markers);
          markers.forEach((marker) => {
          const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

          const element = document.createElement('div');
            element.className = 'marker';
            element.style.backgroundImage = "url('https://res.cloudinary.com/detnzqadn/image/upload/v1599154754/icon1_acsz25.png')";
            element.style.backgroundSize = 'contain';
            element.style.width = '50px';
            element.style.height = '50px';

          new mapboxgl.Marker(element)
            .setLngLat([ marker.lng, marker.lat ])
            .setPopup(popup)
            .addTo(map);
          });
        });

    } else {
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/bright-v8',
        center: [params['lon'], params['lat']],
        zoom: 7
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
        });
      }

      const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = "url('https://res.cloudinary.com/detnzqadn/image/upload/v1599154754/icon1_acsz25.png')";
        element.style.backgroundSize = 'contain';
        element.style.width = '50px';
        element.style.height = '50px';

      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
    }



    // fitMapToMarkers(map, markers);

  }
};

export { initMapbox };
