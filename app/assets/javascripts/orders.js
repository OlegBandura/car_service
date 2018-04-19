$( document ).on('turbolinks:load', function() {
  var car_models;
  car_models = $('#car_car_model_id').html();
  console.log(car_models);
  return $('#car_brand_id').change(function() {
    var brand, options;
    brand = $('#car_brand_id :selected').text();
    options = $(car_models).filter("optgroup[label=" + brand + "]").html();
    console.log(options);
    if (options) {
      return $('#car_car_model_id').html(options);
    } else {
      return $('#car_car_model_id').empty();
    }
  });
});

$(function() {
    $('.datepicker').datepicker({dateFormat: 'yy-mm-dd'});
})
