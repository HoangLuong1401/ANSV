/**
* Template Name: Company - v2.2.1
* Template URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/
!(function($) {
	"use strict";

	// Smooth scroll for the navigation menu and links with .scrollto classes
	var scrolltoOffset = $('#header').outerHeight() - 2;
	$(document).on('click', '.nav-menu a, .mobile-nav a, .scrollto', function(e) {
		if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
			var target = $(this.hash);
			if (target.length) {
				e.preventDefault();

				var scrollto = target.offset().top - scrolltoOffset;

				if ($(this).attr("href") == '#header') {
					scrollto = 0;
				}

				$('html, body').animate({
					scrollTop: scrollto
				}, 1500, 'easeInOutExpo');

				if ($(this).parents('.nav-menu, .mobile-nav').length) {
					$('.nav-menu .active, .mobile-nav .active').removeClass('active');
					$(this).closest('li').addClass('active');
				}

				if ($('body').hasClass('mobile-nav-active')) {
					$('body').removeClass('mobile-nav-active');
					$('.mobile-nav-toggle i').toggleClass('icofont-navigation-menu icofont-close');
					$('.mobile-nav-overly').fadeOut();
				}
				return false;
			}
		}
	});

	// Activate smooth scroll on page load with hash links in the url
	$(document).ready(function() {
		if (window.location.hash) {
			var initial_nav = window.location.hash;
			if ($(initial_nav).length) {
				var scrollto = $(initial_nav).offset().top - scrolltoOffset;
				$('html, body').animate({
					scrollTop: scrollto
				}, 1500, 'easeInOutExpo');
			}
		}

	var owl = $("#owl-demo");
 
  owl.owlCarousel({
 	autoPlay : 2000,
 	items : 5, //10 items above 1000px browser width
	itemsDesktop : [1000,5], //5 items between 1000px and 901px
	itemsDesktopSmall : [900,3], // betweem 900px and 601px
	itemsTablet: [600,2], //2 items between 600 and 0
	itemsMobile : true // itemsMobile disabled - inherit from itemsTablet option
  });
  var owl2 = $("#owl-demo2");
 
  owl2.owlCarousel({
  	rtl:true,
 	autoPlay : 2000,
 	items : 5, //10 items above 1000px browser width
	itemsDesktop : [1000,5], //5 items between 1000px and 901px
	itemsDesktopSmall : [900,3], // betweem 900px and 601px
	itemsTablet: [600,2], //2 items between 600 and 0
	itemsMobile : true // itemsMobile disabled - inherit from itemsTablet option
  });		
	
  // Get current path and find target link
	  var path = window.location.pathname.split("/").pop();
	  console.log(path);
	  // Account for home page with empty path
	  if ( path == '' ) {
	    path = 'trang-chu';
	  }
	 
	  var target = $('nav a[href="'+path+'"]');
	  // Add active class to target link
	  target.parent().addClass('active');
	  target.parent().parent().parent().addClass('active');
	  target.parent().parent().parent().parent().parent().addClass('active');
	  
});

	/*Đầu: Đoạn code phần product_detail (Hiệu ứng phóng lớn)*/
	$(document).ready(function() {
		$("#zoom").elevateZoom({ gallery: 'list-thumb', cursor: 'pointer', galleryActiveClass: 'active', imageCrossfade: true, loadingIcon: 'http://www.elevateweb.co.uk/spinner.gif' });

		var list_thumb = $('#list-thumb');
		list_thumb.owlCarousel({
			navigation: true,
			navigationText: false,
			paginationNumbers: false,
			pagination: false,
			stopOnHover: true,
			items: 5, //10 items above 1000px browser width
			itemsDesktop: [1000, 5], //5 items between 1000px and 901px
			itemsDesktopSmall: [900, 5], // betweem 900px and 601px
			itemsTablet: [768, 5], //2 items between 600 and 0
			itemsMobile: true // itemsMobile disabled - inherit from itemsTablet option
		});
	});
	/*Cuối: Đoạn code phần product_detail (Hiệu ứng phóng lớn)*/



	// Mobile Navigation
	if ($('.nav-menu').length) {
		var $mobile_nav = $('.nav-menu').clone().prop({
			class: 'mobile-nav d-lg-none'
		});
		$('body').append($mobile_nav);
		$('body').prepend('<button type="button" class="mobile-nav-toggle d-lg-none"><i class="icofont-navigation-menu"></i></button>');
		$('body').append('<div class="mobile-nav-overly"></div>');

		$(document).on('click', '.mobile-nav-toggle', function(e) {
			$('body').toggleClass('mobile-nav-active');
			$('.mobile-nav-toggle i').toggleClass('icofont-navigation-menu icofont-close');
			$('.mobile-nav-overly').toggle();
		});

		$(document).on('click', '.mobile-nav .drop-down > a', function(e) {
			e.preventDefault();
			$(this).next().slideToggle(300);
			$(this).parent().toggleClass('active');
		});

		$(document).click(function(e) {
			var container = $(".mobile-nav, .mobile-nav-toggle");
			if (!container.is(e.target) && container.has(e.target).length === 0) {
				if ($('body').hasClass('mobile-nav-active')) {
					$('body').removeClass('mobile-nav-active');
					$('.mobile-nav-toggle i').toggleClass('icofont-navigation-menu icofont-close');
					$('.mobile-nav-overly').fadeOut();
				}
			}
		});
	} else if ($(".mobile-nav, .mobile-nav-toggle").length) {
		$(".mobile-nav, .mobile-nav-toggle").hide();
	}

	// Intro carousel
	var heroCarousel = $("#heroCarousel");
	var heroCarouselIndicators = $("#hero-carousel-indicators");
	heroCarousel.find(".carousel-inner").children(".carousel-item").each(function(index) {
		(index === 0) ?
			heroCarouselIndicators.append("<li data-target='#heroCarousel' data-slide-to='" + index + "' class='active'></li>") :
			heroCarouselIndicators.append("<li data-target='#heroCarousel' data-slide-to='" + index + "'></li>");
	});

	heroCarousel.on('slid.bs.carousel', function(e) {
		$(this).find('.carousel-content ').addClass('animate__animated animate__fadeInDown');
	});

	// Back to top button
	$(window).scroll(function() {
		if ($(this).scrollTop() > 100) {
			$('.back-to-top').fadeIn('slow');
		} else {
			$('.back-to-top').fadeOut('slow');
		}
		/*console.log($('html').scrollTop());*/
		if ($(this).scrollTop() == 160) {
			$('html').animate({
				scrollTop: $("#about-us").offset().top
			}, 1000);
		}
	});

	$('.back-to-top').click(function() {
		$('html, body').animate({
			scrollTop: 0
		}, 1500, 'easeInOutExpo');
		return false;
	});

	// Porfolio isotope and filter
	$(window).on('load', function() {
		var portfolioIsotope = $('.portfolio-container').isotope({
			itemSelector: '.portfolio-item'
		});

		$('#portfolio-flters li').on('click', function() {
			$("#portfolio-flters li").removeClass('filter-active');
			$(this).addClass('filter-active');

			portfolioIsotope.isotope({
				filter: $(this).data('filter')
			});
			aos_init();
		});

		// Initiate venobox (lightbox feature used in portofilo)
		$(document).ready(function() {
			$('.venobox').venobox();
		});
	});

	// Skills section
	$('.skills-content').waypoint(function() {
		$('.progress .progress-bar').each(function() {
			$(this).css("width", $(this).attr("aria-valuenow") + '%');
		});
	}, {
		offset: '80%'
	});

	// Portfolio details carousel
	$(".portfolio-details-carousel").owlCarousel({
		autoplay: true,
		dots: true,
		loop: true,
		items: 1
	});

	// Init AOS
	function aos_init() {
		AOS.init({
			duration: 1000,
			once: true
		});
	}
	$(window).on('load', function() {
		aos_init();
	});

})(jQuery);