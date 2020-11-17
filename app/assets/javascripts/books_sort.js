$(function() {
  const selectMenu = '.SortLabel__select'

  // プルダウンメニューを選択することでイベントが発生
  $(selectMenu).change(function() {
    $('.SortSubmit').trigger('click');
  });

  // ページ遷移後の挙動
  $(function () {
    const selected_option = $(selectMenu).data('sort');

    if(selected_option == "created_at DESC") {
      var sort = 0
    } else if (selected_option == "created_at ASC") {
      var sort = 1
    } else if (selected_option == "updated_at DESC") {
      var sort = 2
    } else if (selected_option == "updated_at ASC") {
      var sort = 3
    }

    var add_selected = $(selectMenu).children().children()[sort]
    $(add_selected).attr('selected', true)
  });
});
