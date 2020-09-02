require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// External imports
import "bootstrap";
import Swiper from 'swiper/bundle';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initMapbox } from '../plugins/init_mapbox'

import { initStarRating } from '../plugins/init_star_rating';

import { hidingHome } from '../packs/hiding_home';
import { initSelect2 } from '../plugins/init_select2';
import { initAutocomplete } from '../plugins/init_autocomplete';

const menuButton = document.getElementById('main-menu-button')
const navBar = document.getElementById('main-menu-nav')
const closeNav = document.getElementById('main-menu-close')
const searchButton = document.getElementById('main-search-button')
const showPhoto = document.querySelectorAll('.show-photo')
const mainPhoto = document.querySelector('.show-main')
const favoriteButton = document.querySelector('.favorite-button')
const backButton = document.getElementById('main-back-button')
const connectSpotify = document.getElementById('spb')
const genreButtons = document.querySelectorAll('.genre-container');

if (connectSpotify != null) {
  connectSpotify.addEventListener('click', () => {
    navigator.geolocation.getCurrentPosition((data) => {
      var prmstr = window.location.search
      const lat = data.coords.latitude;
      const lon = data.coords.longitude;

    });
  })
}

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

if (window.location.pathname=='/places') {
  if (params['lon']=='') {
    navigator.geolocation.getCurrentPosition((data) => {
      const lat = data.coords.latitude;
      const lon = data.coords.longitude;
      const query = params['query'];
      console.log('joli');
      window.location.href = `/places?lon=${lon}&lat=${lat}&query=${query}&gl=y`;
    });
  }
}


genreButtons.forEach((button) => {
  button.addEventListener('click', function() {
      navigator.geolocation.getCurrentPosition((data) => {
      const lat = data.coords.latitude;
      const lon = data.coords.longitude;
      const query = button.dataset.genre;
      window.location.href = `/places?lon=${lon}&lat=${lat}&query=${query}&gl=y`;
    });
  });
})


if (backButton != null) {
  backButton.addEventListener('click', () => {
    window.history.back();
  })
}

if (favoriteButton != null) {
  favoriteButton.addEventListener('click', () => {
    favoriteButton.classList.toggle('pressed');
    favoriteButton.classList.toggle('unpressed');
  })
}

if (showPhoto != null) {
  showPhoto.forEach((photo) => {
    photo.addEventListener('click', () => {
      var re = /background-image: url\(.*\);/;
      let newPhoto = photo.getAttribute('style');
      let result = newPhoto.match(re);
      mainPhoto.removeAttribute('style');
      mainPhoto.setAttribute('style', `${result[0]}`);
    });
  });
}

if (menuButton != null ) {
  menuButton.addEventListener('click',() =>{
    navBar.classList.toggle("top");
    navBar.classList.toggle("bottom")
  });
}

if (closeNav != null ) {
  closeNav.addEventListener('click',() =>{
    navBar.classList.toggle("top");
    navBar.classList.toggle("bottom")
  });
}

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
  initStarRating();
  initSelect2();
  initAutocomplete();
});

var swiper = new Swiper('.s1', {
  slidesPerView: 2.7,
  spaceBetween: 10,

  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
});

var swiper = new Swiper('.s2', {
  pagination: {
    el: '.swiper-pagination',
    dynamicBullets: true,
  },
});

var swiper = new Swiper('.s3', {
  slidesPerView: 'auto',
  spaceBetween: 10,
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
});

var swiper = new Swiper('.s4', {
  slidesPerView: 2.2,
  spaceBetween: 10,

  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
});

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
