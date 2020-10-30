$(function(){
  /* アイコンの変更 */
  let change_book_icon = $('.change-book-icon');
  let image_icon = '.cover__image__top-icon';

  change_book_icon.on("click", function(){
    let icon = $(this).css("background-image");
    $(image_icon).css('background-image', icon);
  });
});
