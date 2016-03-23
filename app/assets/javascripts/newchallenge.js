$(function() {
  $('a[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });

var executed = false;
 $('.question-container').bind('mousewheel', function(e) {
    if (!executed) {
      executed = true;
      var delta = e.originalEvent.wheelDelta;
      if(delta < 0) {
        if($(this).data('next')) {
          $('html, body').animate({
            scrollTop: $($(this).data('next')).offset().top
          }, 500);
        }
      } else if (delta > 0) {
          if($(this).data('prev')) {
        $('html, body').animate({
            scrollTop: $($(this).data('prev')).offset().top            
        }, 500);
          }
        
      }

      setTimeout(function() {
        executed = false
      }, 1000)
    };

 });
});


