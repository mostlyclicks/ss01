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
});

$(document).ready(function () {
  $('.carousel').carousel({
  interval: 15000
})
});


//Parallax

$(document).ready(function(){
   // cache the window object
   $window = $(window);
 
   $('section[data-type="background"]').each(function(){
     // declare the variable to affect the defined data-type
     var $scroll = $(this);
                     
      $(window).scroll(function() {
        // HTML5 proves useful for helping with creating JS functions!
        // also, negative value because we're scrolling upwards                             
        var yPos = -($window.scrollTop() / $scroll.data('speed')); 
         
        // background position
        var coords = '50% '+ yPos + 'px';
 
        // move the background
        $scroll.css({ backgroundPosition: coords });    
      }); // end window scroll
   });  // end section function
}); // close out script