$(function() {
  $(document).on('change', '.image-icon', function() {
    let icon = $('.image-icon').val();
    // let  url = location.href

    console.log(icon);
    $('.account-edit-right__icon').css('background-image', 'url("' + icon +'")');
    // console.log(url);
    // $.ajax({
    //   url: url,
    //   type: 'POST',
    //   dataType: 'json',
    //   data: {icon: icon},
    //   processData: false,
    //   contentType: false
    // })
    // .done(function(data){
    //   console.log(data);
    // })
    // .fail(function(){

    // });
  });
});