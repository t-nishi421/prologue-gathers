$(function(){

  // 【マイページ】サイドバーのリサイズ
  $(window).on('load resize', function(){
    const WideContent = '.WideContent';
    const SmallContent = '.SmallContent';
    const SmallContentSpecial = '.SmallContent.Special';
    
    var winW = $(window).width();
    var devW = 1090;
    if (winW <= devW) {
      //devWpx以下の時の処理
      $(WideContent).css('display', 'none');
      if($('.center').length) {
        //classが存在したら実行する
        $(SmallContentSpecial).css('display', 'block');
      } else {
        $(SmallContent).css('display', 'block');
      }
    } else {
      //devWpxより大きい時の処理
      $(WideContent).css('display', 'block');
      if($('.center').length) {
        //classが存在したら実行する
        $(SmallContentSpecial).css('display', 'none');
      } else {
        $(SmallContent).css('display', 'none');
      }
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