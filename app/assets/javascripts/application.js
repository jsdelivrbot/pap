//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require ScrollToFixed
//= require_tree .

$(document).on('turbolinks:load', function() {
  console.log("i'm here");
  // unless ()
  $('#div_sidebar').scrollToFixed({marginTop: 10, limit: $('footer').offset().top});

  if ($('.card').length == 1) {
    $('.oneflat').removeClass("hidden")
  }
});

// code below is used to display elements with checkboxes in select input
