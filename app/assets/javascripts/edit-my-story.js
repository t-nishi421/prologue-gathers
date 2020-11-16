$(function() {
  const editButton = '.StoryEditButton';
  const stopEditButton = '.StopStoryEditButton';

  const showContent = '.MyStoryEditText';
  const editContent = '.MyStoryEditForm';

  $(editButton).on('click', function() {
    $(showContent).css('display', 'none');
    $(editContent).css('display', 'block');
  });

  $(stopEditButton).on('click', function() {
    $(showContent).css('display', 'block');
    $(editContent).css('display', 'none');
  });
});