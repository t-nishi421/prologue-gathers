$(function() {
  const selectMenu = '.SortIcons'
  const noSelectIcon = '.BookIcon__image';
  const selectedIcon = '.BookIcon__image--selected';

  $(noSelectIcon).on('click', function() {
    if ($(this).hasClass(selectedIcon)) {
      $(this).css('background-color', '');
      $(this).css('filter', 'invert(0)');
      $(this).removeClass(selectedIcon);
    } else {
      $(this).css('background-color', '#e6a121');
      $(this).css('filter', 'invert(1)');
      $(this).addClass(selectedIcon);
    }
  });

  $(function(){
    const selected_option = $(selectMenu).data('book_icon');
    const image = '.SortIconNumber';
    const input = '#book_icon';
    let indexIcon = null;

    if (selected_option != undefined) {
      for (let i = 0; i < selected_option.length; i++) {
        indexIcon = selected_option[i];
        $(input + indexIcon).attr("checked",true);
        $(image + indexIcon).css('background-color', '#e6a121');
        $(image + indexIcon).css('filter', 'invert(1)');
        $(image + indexIcon).addClass(selectedIcon);
      }
    }
  });
});
