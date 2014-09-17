// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require TweenMax.min.js
//= require impress.js
//= require opening_animation.js
//= require animations.js
//= require forms
//= require impress-customization
//= require_tree .

$.fn.peity.defaults.pie = {
  delimiter: null,
  diameter: 50,
  fill: ["#FF2B06", "#9E2515", "#F95E4E", "#F9E5E4"],
  height: null,
  width: null
}

$(document).ready(function(){
  $(".pie").peity("pie")
  new OpeningAnimation('.menu').animate()
})
