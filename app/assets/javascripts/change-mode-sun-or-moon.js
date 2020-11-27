$(function() {
  /*** 変数 ***/
  // 手動設定
  // 全画面
  const modeChangeButton = '.stealSwitch';
  const sunArea = '.stealSwitch__sun';
  const moonArea = '.stealSwitch__moon';
  const wrapper =  '.wrapper';
  const moonContent = '.MoonContent';
  const sunContent = '.SunContent';

  // トップページ
  const goToIndexPage = '.GoToIndexPage';

  // show, edit画面
  const showBookArea = '.MainContents';
  const stealContents = '.StealContents';

  // new画面
  const newStealContents = '.UseStealContents';

  // マイページ
  const logoutButton = '.LogoutButton';

  // 自動設定
  let modeSunOrMoon = true; // 太陽:true, 月:false

  /*** 関数 ***/
  function addModeToSession(){
    sessionStorage.setItem('mode', modeSunOrMoon);
  }

  function sunMode() {
    modeSunOrMoon = true;
    $(sunArea).css('opacity', '1');
    $(moonArea).css('opacity', '0.2');
    $(wrapper).css('background-color', "rgba(0, 50, 100, 0.3)");
    $(showBookArea).css('margin-right', '0px');
    $(stealContents).css('display', 'none');
    $(newStealContents).css('display', 'none');
    $(moonContent).css('display', 'none');
    $(sunContent).css('display', 'block');
    $(goToIndexPage).css('background', '');
    $(goToIndexPage).hover(function(){
      $(this).css('background', '');
    }, function(){
      $(this).css('background', '');
    });
    addModeToSession();
  }
  
  function moonMode() {
    modeSunOrMoon = false;
    $(sunArea).css('opacity', '0.2');
    $(moonArea).css('opacity', '1');
    $(wrapper).css('background-color', "rgba(0, 25, 50, 0.7)");
    $(showBookArea).css('margin-right', '280px');
    $(stealContents).css('display', 'block');
    $(newStealContents).css('display', 'block');
    $(moonContent).css('display', 'block');
    $(sunContent).css('display', 'none');
    $(goToIndexPage).css('background', 'linear-gradient(#ddffdd, #a9e4a9)');
    $(goToIndexPage).hover(function(){
      $(this).css('background', 'linear-gradient(#afdaaf, #7db37d)');
    }, function(){
      $(this).css('background', 'linear-gradient(#ddffdd, #a9e4a9)');
    });
    addModeToSession();
  }
  
  /*** イベント ***/
  $(document).ready(function(){
    var session = sessionStorage.getItem('mode');
    if (session == "true" || session == null) {
      sunMode();
    } else {
      moonMode();
    }
  });    

  $(modeChangeButton).on('click',function(){
    if(modeSunOrMoon) { // moonモードに変更
      moonMode();
    } else { // sunモードに変更
      sunMode();
    }
  });

  $(logoutButton).on('click', function(){
    sessionStorage.removeItem('mode');
  });
});
