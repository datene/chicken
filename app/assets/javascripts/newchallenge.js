$(function() {
  $('a[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top
        }, 500);
        return false;
      }
    }
  });

  $('#button1').click(function () {
    $('#activity').text($('#challenge_activity').val());
  });

  $('#button2').click(function () {
    $('#challenger').text($('#challenge_email_challenger').val());
  });

  $('#challenge_wager_amount').click(function () {
    $('#wager').text($('#challenge_wager_amount').val());
  });

  var executed = false;
  $('.question-container').bind('mousewheel', function(e) {
    console.log(e)
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

  $('.questions-container input').on('keydown', function(e) {
    if(e.keyCode == 13) {
      e.preventDefault();
      $(this).parent().parent().parent().find('a').click()
    }
  })
});
