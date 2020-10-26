$(function(){
  /* アイコンの変更 */
  let change_book_icon = $('.change-book-icon');

  change_book_icon.on("click", function(){
    let icon = $(this).css("background-image");
    $('.cover__image__top-icon').css('background-image', icon);
  });
});
