//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require ScrollToFixed
//= require geocoder
//= require underscore
//= require gmaps/google
//= require_tree .

$(document).ready(function() {
  // unless ()
  $('#div_sidebar').scrollToFixed({limit: $('footer').offset().top});

  if ($('.card').length == 1) {
    $('.oneflat').removeClass("hidden")
  }
});

// code below is used to display elements with checkboxes in select input
