$(function() {
  /*** 変数 ***/
  // 手動設定
  const modeChangeButton = '.stealSwitch';
  const sunArea = '.stealSwitch__sun';
  const moonArea = '.stealSwitch__moon';
  const wrapper =  '.wrapper';

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
    $(wrapper).css('background-color', "rgba(0, 50, 100, 0.2)");
    addModeToSession();
  }
  
  function moonMode() {
    modeSunOrMoon = false;
    $(sunArea).css('opacity', '0.2');
    $(moonArea).css('opacity', '1');
    $(wrapper).css('background-color', "rgba(0, 25, 50, 0.7)");
    addModeToSession();
  }
  
  /*** イベント ***/
  $(document).ready(function(){
    var session = sessionStorage.getItem('mode');
    console.log(session);
    if (session == "true") {
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
});
