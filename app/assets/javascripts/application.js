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
//= require TweenMax.min.js
//= require impress.js
//= require opening_animation.js
//= require animations.js
//= require forms
//= require impress-customization
//= require jquery.tooltipster.min.js
//= require spin
//= require jquery.spin
//= require_tree .

$(document).ready(function(){
  $.fn.peity.defaults.pie = {
    delimiter: null,
    diameter: 50,
    fill: ["#FF2B06", "#9E2515", "#F95E4E", "#F9E5E4"],
    height: null,
    width: null
  }

  $('.organizer-item .avatar').tooltipster({
    position: 'right',
    theme: 'tooltipster-light',
    contentAsHTML: true,
    functionInit: function(){
      return $(this).parent().find('.bio').html();
    },
    functionReady: function(){
      $(this).parent().attr('aria-hidden', false);
    },
    functionAfter: function(){
      $(this).parent().attr('aria-hidden', true);
    }
  });

  $('body').on('ajax:beforeSend', 'form', function(){
    $(this).find('.btn-submit').
      spin({ width: 3, length: 2, radius: 5, lines: 10 }).
      css('color', 'transparent')
  });
})
