$(function() {
  // sort機能
  const selectMenu = '.SortLabel__select'
  const submit = '.SortSubmit';

  // プルダウンメニューを選択することでイベントが発生
  $(selectMenu).change(function() {
    $(submit).trigger('click');
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
    } else if (selected_option == "bookmarks DESC") {
      var sort = 4
    } else if (selected_option == "bookmarks ASC") {
      var sort = 5
    }

    var add_selected = $(selectMenu).children().children()[sort]
    $(add_selected).attr('selected', true)
  });

  // 貸出状態

  const SearchRentalState = '.SearchRentalState';
  const checkBox = '.CheckBox';

  $(function () {
    const rentalParams = $(SearchRentalState).data('rental');
    
    if (rentalParams != undefined) {
      if (rentalParams.includes("rental")) {
        $(checkBox + '.rental').attr("checked",true);
      }
      if (rentalParams.includes("notRental")) {
        $(checkBox + '.notRental').attr("checked",true);
      }
      if (rentalParams.includes("complete")) {
        $(checkBox + '.complete').attr("checked",true);
      }
    }
  });
});
