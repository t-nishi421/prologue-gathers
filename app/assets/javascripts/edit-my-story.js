$(function() {
  // ボタン
  const editButton = '.StoryEditButton';
  const stopEditButton = '.StopStoryEditButton';
  const submitButton = '.MyStoryUpdateButton';
  const viewTextArea = '.story-content__text';

  const showContent = '.MyStoryEditText';
  const editContent = '.MyStoryEditForm';

  const updateMessage = '.UpdateMessage';
  const failMessage = '更新に失敗しました';

  $(editButton).on('click', function() {
    const textHeight = $(this).parent().parent().parent().find(viewTextArea).css('height');
    $(this).parent().parent().parent().find('textarea').css('height', textHeight);

    $(this).parent().parent().css('display', 'none');
    $(this).parent().parent().parent().find(editContent).css('display', 'block');
  });

  $(stopEditButton).on('click', function() {
    $(this).parent().parent().css('display', 'none');
    $(this).parent().parent().parent().find(showContent).css('display', 'block');
  });

  $(submitButton).on('click', function(e) {
    const text = $(this).parent().parent().find('textarea').val();
    const text_id = $(this).data('id');
    const url = `/texts/${text_id}`
    $.ajax({
      url: url,
      type: 'PATCH',
      data: { id: text_id,
              new_text: text},
      dataType: 'json',
      context: this
    })
    .done(function(data){
      const text = data.text.replace( /\r?\n/g, '<br />' );
      $(this).parent().parent().find('textarea').val(data.text);
      $(`.story-content__text.text_id${data.id}`).html(text);
      
      $(this).parent().parent().css('display', 'none');
      $(this).parent().parent().parent().find(showContent).css('display', 'block');

      const mousePositionX = e.pageX;
      const mousePositionY = e.pageY;
      // アラート文の表示
      $(updateMessage).css('left', `${mousePositionX - 50}px`);
      $(updateMessage).css('top', `${mousePositionY - 30}px`);
      $(updateMessage).show().delay(1000).fadeOut(400);
    })
    .fail(function(){
      alert(failMessage);
    })
  });
});