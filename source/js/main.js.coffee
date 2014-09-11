//= require vendor/TweenMax.min.js
//= require vendor/impress.js
//= require opening_animation.js
//= require animations.js


$.fn.peity.defaults.pie = {
  delimiter: null,
  diameter: 50,
  fill: ["#FF2B06", "#9E2515", "#F95E4E", "#F9E5E4"],
  height: null,
  width: null
}
$(".pie").peity("pie")

new OpeningAnimation('.menu').animate()
