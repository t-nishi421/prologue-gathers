$(function(){

  // *** 手動設定変数 ***

  // 共通
  const bookmarkDataName = 'id';
  const totalNumberOfBookmarks = '.TotalNumberOfBookmarks';
  // 登録
  const bookmark = '.SaveBookmarkButton';
  const bookmarkUrl = '/books/bookmark';
  const bookmarkAlert = 'お気に入り登録に失敗しました';
  // 登録解除
  const deleteBookmark = '.DeleteBookmarkButton';
  const deleteUrl = '/books/delete_bookmark';
  const deleteAlert = 'お気に入り登録解除に失敗しました';

  // *** イベント ***

  // お気に入り登録ボタンが押された時
  $(document).on('click', bookmark, function(){
    const book_id = $(this).data(bookmarkDataName);
    $.ajax({
      url: bookmarkUrl,
      type: 'GET',
      data: { id: book_id },
      dataType: 'json',
      context: this
    })
    .done(function(data){
      $(this).removeClass(bookmark.slice(1));
      $(this).addClass(deleteBookmark.slice(1));
      $(this).parent().children(totalNumberOfBookmarks).text(data.count);
    })
    .fail(function(){
      alert(bookmarkAlert);
    })
  })

  // 登録解除ボタンが押された時
  $(document).on('click', deleteBookmark, function(){
    const book_id = $(this).data(bookmarkDataName);
    $.ajax({
      url: deleteUrl,
      type: 'GET',
      data: { id: book_id },
      dataType: 'json',
      context: this
    })
    .done(function(data){
      $(this).removeClass(deleteBookmark.slice(1));
      $(this).addClass(bookmark.slice(1));
      $(this).parent().children(totalNumberOfBookmarks).text(data.count);
    })
    .fail(function(){
      alert(deleteAlert);
    })
  })
})
