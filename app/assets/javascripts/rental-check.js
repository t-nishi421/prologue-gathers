$(function(){

  const rentalButton = '.UnderRental';

  let url = function(id) {
    return `/books/${id}rental`;
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