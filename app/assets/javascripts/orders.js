$( document ).on('turbolinks:load', function() {
  var car_models;
  car_models = $('#order_car_model_id').html();
  console.log(car_models);
  return $('#order_brand_id').change(function() {
    var brand, options;
    brand = $('#order_brand_id :selected').text();
    options = $(car_models).filter("optgroup[label=" + brand + "]").html();
    console.log(options);
    if (options) {
      return $('#order_car_model_id').html(options);
    } else {
      return $('#order_car_model_id').empty();
    }
  });
});
