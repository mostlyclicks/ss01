/* ==============================================
Smooth Scroll To Anchor
=============================================== */

//jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('.navbar a,.btn,.scroll-btn').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top - 105
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});


//STICKY NAV
$(document).ready(function(){
    $(".navbar").sticky({topSpacing:0});
});


//Add TWBS img-responsive class to all blog images
$(document).ready(function(){
  $("#blog-left img").addClass("img-responsive");
});

//Tooltip
$(document).ready(function () {
  $('[data-toggle="tooltip"]').tooltip()
})