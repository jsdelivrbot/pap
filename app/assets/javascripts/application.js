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
});

// code below is used to display elements with checkboxes in select input

var expanded = false;

function showCheckboxes() {
  var checkboxes = document.getElementById("checkboxes");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}
