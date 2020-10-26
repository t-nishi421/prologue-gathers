$(function() {
  
  /*** 変数 ***/
  // 手動設定
  const sentencesArea = '.story-content__text';
  const addStealSentencesArea = '.StealContents__stealSentences__sentences';
  const saveButton = '.SentenceBox__saveButton';
  const sentence = '.sentence';

  // 自動設定
  let indexNumber = 0;

  let stealSentence = function(sentence, thisIndex) {
    const html = 
    `<div class="SentenceBox">
      <div class="SentenceBox__saveButton" data-index="${thisIndex}">
        <i class="fa fa-save"></i>
      </div>
      <div class="SentenceBox__sentence sentence${thisIndex}">
        ${sentence}
      </div>
    </div>`;
    return html;
  }
  
  // ドラッグした文章を取得
  $(sentencesArea).on('mouseup', function(e){  //mouseupでイベント発火
    var selectedStr;
    if(window.getSelection){  //selectionオブジェクト取得
      selectedStr = window.getSelection().toString();  //文章取得
      if(selectedStr !== '' && selectedStr !== '\n'){  //文章チェック
        console.log(selectedStr);
        $(addStealSentencesArea).append(stealSentence(selectedStr, indexNumber));
        indexNumber++;
      }
    }
  });

  // セーブ
  $(saveButton).on('click', function(){
    const targetIndex = $(this).data('index');
    const text = $(sentence + targetIndex).text();
    console.log(text); // 保存するテキスト
  });
});