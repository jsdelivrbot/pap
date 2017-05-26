$(document).on('turbolinks:load', function() {
  $('.thumbnail').on('click', toggleActiveThumbnail);
  $(".accordion").on('click', showHiddenDiv);
});

function toggleActiveThumbnail(event) {
  $('#flat-data-thumbnail .thumbnail').removeClass('active');
  var source = $(this).attr("src");
  var style = "background-image: linear-gradient(-225deg, rgba(0,101,168,0.6) 0%, rgba(0,36,61,0.6) 50%), url(" + source + ")";
  $(this).addClass('active');
  $('.flat-page-pic').attr("style", style);
}

function showHiddenDiv(event) {
  var contentToShow = this.nextElementSibling;
  console.log(contentToShow);
  $(contentToShow).toggleClass('hidden-xs');
}
