function jpostal() {
  $('#zipcode').jpostal({
    postcode : ['#zipcode'],
    addres : {
      '#post_address': '%3%4%5'
    }
  });
}
$(document).on("turbolinks:load".jpostal);
