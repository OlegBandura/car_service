$( document ).on('turbolinks:load', function() {
  var car_models;
  car_models = $('#profile_car_model_id').html();
  console.log(car_models);
  return $('#profile_brand_id').change(function() {
    var brand, options;
    brand = $('#profile_brand_id :selected').text();
    options = $(car_models).filter("optgroup[label=" + brand + "]").html();
    console.log(options);
    if (options) {
      return $('#profile_car_model_id').html(options);
    } else {
      return $('#profile_car_model_id').empty();
    }
  });
});
