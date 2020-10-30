$(function(){

  const rentalButton = '.UnderRental';

  let url = function(id) {
    let url = `/books/${id}rental`;
    return url
  }

  $(rentalButton).on('click', function() {
    const id = $(this).data('id');
      if(confirm('本の複数貸出はできません\n貸出中の本と入れ替えますか？')) {  
        location.href = url(id);
    } else {  
        return false;  
    }
  });
});