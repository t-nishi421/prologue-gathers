$(function() {
  
  /*** 変数 ***/
  // 手動設定
  const sentencesArea = '.story-content__text';
  const addStealSentencesArea = '.StealContents__stealSentences__sentences';
  const saveButton = '.SentenceBox__saveButton';
  const sentence = '.sentence';

  // 自動設定
  let indexNumber = 0;
  let nowEventSaveSentence = false; // イベント発火中に他のイベント発火を防止する

  let stealSentence = function(sentence, thisIndex, targetTextId) {
    const html = 
    `<div class="SentenceBox">
      <div class="SentenceBox__saveButton" data-index="${thisIndex}" data-text_id="${targetTextId}">
        <i class="fa fa-save"></i>
      </div>
      <div class="SentenceBox__sentence sentence${thisIndex}">${sentence}</div>
    </div>`;
    return html;
  }
  
  /*** メソッド ***/
  // 未実装 保存しましたのメッセージ
  // if(nowEventSaveSentence == false) {
  //   nowEventSaveSentence = true;
  //   var comment = setInterval(() => {
  //     if(area_a < 0.4) {
  //       area_a = back_ground_display(area_a);
  //       image_size = view_image_size(image_size);
  //     } else {
  //       clearInterval(comment);
  //       nowEventSaveSentence = false;
  //     }
  //   }, 10);
  // }

  /*** イベント ***/
  // ドラッグした文章を取得
  $(sentencesArea).on('mouseup', function(e){  //mouseupでイベント発火
    const targetTextId = $(this).data('text_id');
    var selectedStr;
    if(window.getSelection){  //selectionオブジェクト取得
      selectedStr = window.getSelection().toString();  //文章取得
      if(selectedStr !== '' && selectedStr !== '\n'){  //文章チェック
        $(addStealSentencesArea).append(stealSentence(selectedStr, indexNumber, targetTextId));
        indexNumber++;
      }
    }
  });

  // セーブ
  $(document).on('click', saveButton, function(){
    const targetIndex = $(this).data('index');
    const targetTextId = $(this).data('text_id');
    const text = $(sentence + targetIndex).text();
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
      $(this).parent().remove();
      alert('センテンスを保存しました');
    })
    .fail(function(){
      alert('保存に失敗しました');
    })
  });
});