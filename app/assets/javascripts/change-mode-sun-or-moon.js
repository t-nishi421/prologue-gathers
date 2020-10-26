$(function() {
  /*** 変数 ***/
  const modeChangeButton = '.stealSwitch'
  const sunArea = '.stealSwitch__sun'
  const moonArea = '.stealSwitch__moon'
  const wrapper =  '.wrapper'

  // 自動設定
  let changeModeEventNow = false
  let modeSunOrMoon = true

  /*** イベント ***/

  $(modeChangeButton).on('click',function(){
    if(modeSunOrMoon) { // moonモードに変更
      modeSunOrMoon = false
      $(sunArea).css('opacity', '0.2');
      $(moonArea).css('opacity', '1');
      $(wrapper).css('background-color', "rgba(0, 25, 50, 0.7)")
    } else { // sunモードに変更
      modeSunOrMoon = true
      $(sunArea).css('opacity', '1');
      $(moonArea).css('opacity', '0.2');
      $(wrapper).css('background-color', "rgba(0, 50, 100, 0.2)")
    }
  });
});
