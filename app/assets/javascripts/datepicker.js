$(document).on('ready page:change', function() {

  $(".datetimepicker").on("dp.change", function (e) {
    var date = e.date
    var deadline = moment(date).add(4, 'weeks')
    var configured = moment(deadline._d).format("dddd Do MMMM YYYY")
    $('#deadline').html(configured)
  });
});