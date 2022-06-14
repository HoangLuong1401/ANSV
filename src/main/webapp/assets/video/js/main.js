var tag = document.createElement('script');
tag.src = 'https://www.youtube.com/iframe_api';
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

(function ($) {
  $(document).ready(function () {
    $('.owl-carousel').owlCarousel({
      loop: false,
      margin: 10,
      nav: true,
      navText: [
        "<i class='fas fa-chevron-left'></i>",
        "<i class='fas fa-chevron-right'></i>",
      ],
      autoplay: false,
      autoplayHoverPause: true,
      responsive: {
        0: {
          items: 3,
        },
        600: {
          items: 4,
        },
        1000: {
          items: 5,
        },
      },
    });
  });
})(jQuery);
