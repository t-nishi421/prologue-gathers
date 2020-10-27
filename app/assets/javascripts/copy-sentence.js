$(function() {
  /*** 変数 ***/
  const copyButton = '.UseSentenceBox__copyButton';
  const copyTextArea = '.sentence';
  const copyMessage = '.CopyMessage';
  /*** イベント ***/
  $(document).on('click', copyButton, function(e){
    const targetIndex = $(this).data('index');
    let text = $(copyTextArea + targetIndex).text();
    text = $.trim(text)
    const mousePositionX = e.pageX;
    const mousePositionY = e.pageY;

    // テキストエリアの作成
    let $textarea = $('<textarea></textarea>');
    // テキストエリアに文章を挿入
    $textarea.text(text);
    // テキストエリアを挿入
    $(this).append($textarea);
    // テキストエリアを選択
    $textarea.select();
    // コピー
    document.execCommand('copy');
    // テキストエリアの削除
    $textarea.remove();
    // アラート文の表示
    $(copyMessage).css('left', `${mousePositionX - 50}px`);
    $(copyMessage).css('top', `${mousePositionY - 30}px`);
    $(copyMessage).show().delay(1000).fadeOut(400);
  });
});