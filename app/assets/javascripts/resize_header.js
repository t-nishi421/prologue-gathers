$(function(){

  // 【マイページ】サイドバーのリサイズ
  $(window).on('load resize', function(){
    const WideContent = '.WideContent';
    const SmallContent = '.SmallContent';
    
    var winW = $(window).width();
    var devW = 1090;
    if (winW <= devW) {
      //devWpx以下の時の処理
      $(WideContent).css('display', 'none');
      $(SmallContent).css('display', 'block');
    } else {
      //devWpxより大きい時の処理
      $(SmallContent).css('display', 'none');
      $(WideContent).css('display', 'block');
    }
  });

  $(window).on('load resize', function(){
    const VerySmallNone = '.VerySmallNone';
    
    var winW = $(window).width();
    var devW = 720;
    if (winW <= devW) {
      //devWpx以下の時の処理
      $(VerySmallNone).css('display', 'none');
    } else {
      //devWpxより大きい時の処理
      $(VerySmallNone).css('display', 'block');
    }
  });
});