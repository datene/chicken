$(document).on('ready page:change', function() {
  $('.datetimepicker').datetimepicker({
    // put here your custom picker options, that should be applied for all pickers
  });

  $('.datetimerange').each(function(){
    var $this = $(this)
    var range1 = $($this.find('.input-group')[0])
    var range2 = $($this.find('.input-group')[1])

    if(range1.data("DateTimePicker").date() != null)
      range2.data("DateTimePicker").minDate(range1.data("DateTimePicker").date());

    if(range2.data("DateTimePicker").date() != null)
      range1.data("DateTimePicker").maxDate(range2.data("DateTimePicker").date());

    range1.on("dp.change",function (e) {
      if(e.date)
        range2.data("DateTimePicker").minDate(e.date);
      else
        range2.data("DateTimePicker").minDate(false);
    });

    range2.on("dp.change",function (e) {
      if(e.date)
        range1.data("DateTimePicker").maxDate(e.date);
      else
        range1.data("DateTimePicker").maxDate(false);
    });
  })

  $(".datetimepicker").on("dp.change", function (e) {
    var date = e.date
    var deadline = moment(date).add(4, 'weeks')
    var deadline_good = deadline._d
    var twoDigitMonth = deadline_good.getMonth()+"";if(twoDigitMonth.length==1)  twoDigitMonth="0" +twoDigitMonth;
    var twoDigitDate = deadline_good.getDate()+"";if(twoDigitDate.length==1) twoDigitDate="0" +twoDigitDate;
    var currentDate = twoDigitDate + "/" + twoDigitMonth + "/" + deadline_good.getFullYear();
// console.log(currentDate);
$('#deadline').html(currentDate)


    // $('#deadline').html(deadline._d)

  });
});