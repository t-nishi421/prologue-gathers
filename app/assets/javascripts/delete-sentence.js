$(function() {
/*** 変数 ***/
  const deleteButton = '.SentenceBox__deleteSentence';
  const copyMessage = '.CopyMessage';

  const deleteMessage = 'センテンスを削除しますか？';
  const doneMessage = 'センテンスを削除しました';
  const failMessage = 'センテンスの削除に失敗しました';

/*** メソッド ***/
  // セーブ
  $(document).on('click', deleteButton, function(){
    var result = confirm(deleteMessage);
    if (result) {
      const targetId = $(this).data('id');
      // 以下ajaxで削除処理
      $.ajax({
        url: '/users/sentence/delete',
        type: 'POST',
        data: { sentence_id: targetId },
        dataType: 'json',
        context: this
      })
      .done(function(data){
        const thisPosition = $(this).offset();
        // アラート文の表示
        $(copyMessage).css('left', `${thisPosition.left - 50}px`);
        $(copyMessage).css('top', `${thisPosition.top - 30}px`);
        $(copyMessage).show().delay(1000).fadeOut(400);

        $(this).parent().remove();
      })
      .fail(function(){
        alert(failMessage);
      })
    }
  });
});