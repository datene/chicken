function addHour() {
  var oldHour = $("#hour").html();
  var newHour = parseInt(oldHour) + 1;
  $("#hour").html(newHour);
}


$('#addhours').click( function() {
  addHour();

});

$('#removehours').click( function() {
  if (parseInt($("#hour").html()) > 0) { 
    var oldHour = $("#hour").html();
    var newHour = parseInt(oldHour) - 1;
    console.log(newHour);
    $("#hour").html(newHour);
  }
  else {
    $("#hour").html(0);
  }
});

$('#addminutes').click( function() {
  var oldMinutes = $("#minute").html();
  var newMinutes = parseInt(oldMinutes) + 10;
  if (newMinutes == 60) {
    addHour();
    $("#minute").html("00");
  } else {
    $("#minute").html(newMinutes);
  }

});


$('#removeminutes').click( function() {
  if (parseInt($("#minute").html()) > 0) { 
    var oldMinutes = $("#minute").html();
    var newMinutes = parseInt(oldMinutes) - 10;
    newMinutes = newMinutes == 0 ? '00' : newMinutes
    $("#minute").html(newMinutes);
  }
  else {
    $("#minute").html("00");
  }
});

$(".button-logging-hours").click( function() {
  var endHour = parseInt($("#hour").html());
  var endHourMinutes = endHour * 60;
  var endMinutes = parseInt($("#minute").html());
  var totalLoggedTimes = endHourMinutes + endMinutes;
  var url = $("#logging-form").data("url");

  $.post(url, { amount: totalLoggedTimes } );
});
