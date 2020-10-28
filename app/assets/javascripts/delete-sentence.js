$(function() {
/*** 変数 ***/
  const deleteButton = '.SentenceBox__deleteSentence';

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
        $(this).parent().remove();
        alert(doneMessage);
      })
      .fail(function(){
        alert(failMessage);
      })
    }
  });
});