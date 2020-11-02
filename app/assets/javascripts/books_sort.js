$(function() {
  const selectMenu = '.SortLabel__select'

  // プルダウンメニューを選択することでイベントが発生
  $(selectMenu).change(function() {

    // 選択したoptionタグのvalue属性を取得する
    var this_value = $(this).val();
    // value属性の値により、ページ遷移先の分岐
    if (this_value == "created_at_desc") {
      html = "&sort=created_at+desc"
    } else if (this_value == "created_at_asc") {
      html = "&sort=created_at+asc"
    } else if (this_value == "updated_at_desc") {
      html = "&sort=updated_at+desc"
    } else if (this_value == "updated_at_asc") {
      html = "&sort=updated_at+asc"
    } else {
      html = ""
    };
    // 現在の表示ページ
    var current_html = window.location.href;
    const searchUrl = '/search?keyword='
    if (current_html.indexOf(searchUrl) == -1) {
      current_html += searchUrl;
    }
    // ソート機能の重複防止 
    if (location['href'].match(/&sort=*.+/) != null) {
      var remove = location['href'].match(/&sort=*.+/)[0]
      var current_html = current_html.replace(remove, '')
    };
    // ページ遷移
    window.location.href = current_html + html
  });
  // ページ遷移後の挙動
  $(function () {
    if (location['href'].match(/&sort=*.+/) != null) {
      // option[selected: 'selected']を削除
      // if ($(`${selectMenu} option[selected=selected]`)) {
      //   $('select option:first').prop('selected', false);
      // }

      var selected_option = location['href'].match(/&sort=*.+/)[0].replace('&sort=', '');

      if(selected_option == "created_at+desc") {
        var sort = 0
      } else if (selected_option == "created_at+asc") {
        var sort = 1
      } else if (selected_option == "updated_at+desc") {
        var sort = 2
      } else if (selected_option == "updated_at+asc") {
        var sort = 3
      }

      var add_selected = $(selectMenu).children()[sort]
      console.log(add_selected);
      $(add_selected).attr('selected', true)
    }
  });
});