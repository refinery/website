// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.mmenu.min.all
//= require wrappers/jquery.mmenu.turbolinks.min
//= require_tree .

ready = function() {
  $('#mobile-menu').mmenu({
    offCanvas: {
      position  : "right"
    },
    currentItem: true,
    extensions  : [ 'effect-slide-menu', 'pageshadow' ],
    counters  : true,
    navbar    : {
      title   : 'Menu'
    },
    navbars   : [
      {
        position  : 'top',
        content   : [
          'prev',
          'title',
          'close'
        ]
      }, {
        position  : 'bottom',
        content   : [
          $('#footer').find('.socials').html()
        ]
      }
    ]
  });

  $(window).resize(function() {
    clearTimeout(timeToWait_mmenu);
    var timeToWait_mmenu = setTimeout($.fn.closeMmenu, 50);
  });
};

$.fn.closeMmenu = function(){
  if($('#mobile-menu').hasClass('mm-opened')){
    $('#mobile-menu').data( "mmenu" ).close();
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);

//= require turbolinks