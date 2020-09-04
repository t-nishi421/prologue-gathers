$(function(){
  let change_book_color = $('.change-book-color');

  change_book_color.on("click", function(){
    let color = $(this).css("color");
    $('.cover__image__top-color').css('background-color', color);
  });
});