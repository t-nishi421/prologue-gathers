$(function(){
  /* 背景色とアイコンの色調整をするイベント */

  /*** 変数 ***/ 
  let change_color_button = $('.change-book-color');
  let image_icon = '.cover__image__top-color';

  /*** イベント ***/
  change_color_button.on("click", function(){
    // 背景色の変更
    let new_color = $(this).css("color");
    $(image_icon).css('background-color', new_color);

    // アイコンを背景色に合わせて変色
    if ($(this).hasClass('icon-white-true')) {
      $(image_icon).css('filter', 'invert(0.9)');
    } else {
      $(image_icon).css('filter', 'invert(0)');
    }
  });
});
