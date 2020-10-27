$(function() {
  $(document).on('change', '.image-icon', function(e) {
    let reader = new FileReader();

    reader.onload = function (e) {
      $('.account-edit-right__icon').css('background-image', 'url(' + e.target.result + ')');
    }
    reader.readAsDataURL(e.target.files[0]);
  });
});
