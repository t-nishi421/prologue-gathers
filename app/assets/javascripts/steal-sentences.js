$(function() {
  
  /*** 変数 ***/
  // 手動設定
  const sentencesArea = '.story-content__text';
  const addStealSentencesArea = '.StealContents__stealSentences__sentences';
  const saveButton = '.SentenceBox__saveButton';
  const sentence = '.sentence';
  const removeStealSentenceFloor = 'StealContents__stealSentences__sentences';
  const copyMessage = '.CopyMessage';

  // 自動設定
  let indexNumber = 0;

  let stealSentence = function(sentence, thisIndex, targetTextId, viewText) {
    const html = 
    `<div class="SentenceBox">
      <div class="SentenceBox__saveButton" data-index="${thisIndex}" data-text_id="${targetTextId}" data-text="${sentence}">
        <i class="fa fa-save"></i>
      </div>
      <div class="SentenceBox__sentence sentence${thisIndex}">${viewText}</div>
    </div>`;
    return html;
  }

  /*** イベント ***/
  // ドラッグした文章を取得
  $(sentencesArea).on('mouseup', function(){  //mouseupでイベント発火
    const targetTextId = $(this).data('text_id');
    var selectedStr;
    if(window.getSelection){  //selectionオブジェクト取得
      selectedStr = window.getSelection().toString();  //文章取得
      const viewText = selectedStr.replace( /\r?\n/g, '<br />' );
      if(selectedStr !== '' && selectedStr !== '\n'){  //文章チェック
        $(addStealSentencesArea).append(stealSentence(selectedStr, indexNumber, targetTextId, viewText));
        indexNumber++;
      }
    }
  });

  // セーブ
  $(document).on('click', saveButton, function(e){
    const targetIndex = $(this).data('index');
    const targetTextId = $(this).data('text_id');
    const text = $(this).data('text');
    
    // 以下ajaxで保存処理
    $.ajax({
      url: '/books/save-sentence',
      type: 'POST',
      data: { sentence: text,
              text_id:  targetTextId},
      dataType: 'json',
      context: this
    })
    .done(function(data){
      if ($(this).parent().parent().hasClass(removeStealSentenceFloor)) {
        $(this).parent().remove();
      }
      const mousePositionX = e.pageX;
      const mousePositionY = e.pageY;
      // アラート文の表示
      $(copyMessage).css('left', `${mousePositionX - 50}px`);
      $(copyMessage).css('top', `${mousePositionY - 30}px`);
      $(copyMessage).show().delay(1000).fadeOut(400);
    })
    .fail(function(){
      alert('保存に失敗しました');
    })
  });
});