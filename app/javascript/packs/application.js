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

const menuButton = document.getElementById('main-menu-button')
const navBar = document.getElementById('main-menu-nav')
const closeNav = document.getElementById('main-menu-close')
const searchButton = document.getElementById('main-search-button')
const showPhoto = document.querySelectorAll('.show-photo')
const mainPhoto = document.querySelector('.show-main')

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
