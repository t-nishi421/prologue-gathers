$(function() {
  $(".SearchBar__textField").keypress(function(e){
    if(e.which == 13){
      $(".SearchBar__submit").click();
    }
  });
});
