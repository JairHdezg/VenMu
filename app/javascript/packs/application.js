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


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
  initStarRating();
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

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})
