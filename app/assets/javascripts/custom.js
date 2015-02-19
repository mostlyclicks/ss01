/* ==============================================
Smooth Scroll To Anchor
=============================================== */

//jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('.navbar a,.btn,.scroll-btn').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top - 85
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});


//STICKY NAV
$(document).ready(function(){
    $(".navbar").sticky({topSpacing:0});
});