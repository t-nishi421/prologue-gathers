$(function() {
  const selectMenu = '.SortColors'
  const noSelectColor = '.BookColor';
  const selectedColor = '.BookColor--selected';
  const allCheckedButton = '.AllChecked';
  const allDeleteCheckedButton = '.AllDeleteChecked';

  $(noSelectColor).on('click', function() {
    if ($(this).hasClass(selectedColor)) {
      $(this).find('i').css('display', 'none');
      $(this).removeClass(selectedColor);
    } else {
      $(this).find('i').css('display', 'block');
      $(this).addClass(selectedColor);
    }
  });

  $(function(){
    const selected_option = $(selectMenu).data('book_color');
    const color = '.SortColorNumber';
    const input = '#book_color';
    let indexColor = null;

    if (selected_option != undefined) {
      for (let i = 0; i < selected_option.length; i++) {
        indexColor = selected_option[i];
        $(input + indexColor).attr("checked",true);
        $(color + indexColor).find('i').css('display', 'block');
        $(color + indexColor).addClass(selectedColor);
      }
    }
  });

  $(allCheckedButton).on('click', function(){
    $(this).parent().parent().find('i').css('display', 'block');
    $(this).parent().parent().find(noSelectColor).addClass(selectedColor);
  });

  $(allDeleteCheckedButton).on('click', function(){
    $(this).parent().parent().find('i').css('display', 'none');
    $(this).parent().parent().find(noSelectColor).removeClass(selectedColor);
  });
});