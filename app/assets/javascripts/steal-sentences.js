$(function() {
  
  /*** 変数 ***/
  const sentencesArea = '.story-content__text';
  
  // ドラッグした文章を取得
  $(sentencesArea).on('mouseup', function(e){  //mouseupでイベント発火
    var selectedStr;
    if(window.getSelection){  //selectionオブジェクト取得
      selectedStr = window.getSelection().toString();  //文章取得
      if(selectedStr !== '' && selectedStr !== '\n'){  //文章チェック
        console.log(selectedStr);
      }
    }
  });
});