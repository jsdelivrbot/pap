//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require ScrollToFixed
//= require_tree .

$(document).ready(function() {
  // unless ()
  $('#div_sidebar').scrollToFixed({marginTop: 10, limit: $('footer').offset().top});

  if ($('.card').length == 1) {
    $('.oneflat').removeClass("hidden")
  }

  //toggle active pic in flats#show view
  $('.thumbnail').on('click', function(event) {
    $('.thumbnail').removeClass('active');
    var source = $(this).attr("src");
    var style = "background-image: linear-gradient(-225deg, rgba(0,101,168,0.6) 0%, rgba(0,36,61,0.6) 50%), url(" + source + ")"
    $(this).addClass('active');
    $('.flat-page-pic').attr("style", style);
  })
});

// code below is used to display elements with checkboxes in select input
