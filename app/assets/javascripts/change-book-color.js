$(function(){
  /* 背景色とアイコンの色調整をするイベント */
  /*** 変数 ***/
  let change_color_button = $('.change-book-color');
  let image_color = '.cover__image__top-color';
  let image_icon = '.cover__image__top-icon';

 /*** イベント ***/
  change_color_button.on("click", function(){
    let color = $(this).css("color");
    $(image_color).css('background-color', color);

    if ($(this).hasClass('icon-white-true')) {
      $(image_icon).css('filter', 'invert(0.9)');
    } else {
      $(image_icon).css('filter', 'invert(0)');
    }
  });
});
