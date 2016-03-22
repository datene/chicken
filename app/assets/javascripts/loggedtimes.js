$('#addhours').click( function() {

  var oldHour = $(".hour").html()
  var newHour = parseInt(oldHour) + 1
  $(".hour").html(newHour)

});

$('#removehours').click( function() {
  if (parseInt($(".hour").html()) > 0) { 
    var oldHour = $(".hour").html()
    var newHour = parseInt(oldHour) - 1
    $(".hour").html(newHour)
  }
  else {
    $(".hour").html(0)
  }
});

$('#addminutes').click( function() {
  var oldMinutes = $(".minute").html()
  var newMinutes = parseInt(oldMinutes) + 10
  $(".minute").html(newMinutes)

});


$('#removeminutes').click( function() {
  if (parseInt($(".minute").html()) > 0) { 
    var oldMinutes = $(".minute").html();
    var newMinutes = parseInt(oldMinutes) - 10;
    $(".minute").html(newMinutes)}
    else {
      $(".minute").html(0)
    }
  });

$(".button-logging-hours").click( function() {
  var endHour = parseInt($(".hour").html());
  var endHourMinutes = endHour * 60
  var endMinutes = parseInt($(".minute").html());
  var totalLoggedTimes = endHourMinutes + endMinutes
  var url = $("#logging-form").data("url");

  $.post(url, { amount: totalLoggedTimes } );
});
