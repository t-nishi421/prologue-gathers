class Sort < ActiveHash::Base
  self.data = [
    {code: 'created_at DESC', name: '投稿が新しい順'},
    {code: 'created_at ASC', name: '投稿が古い順'},
    {code: 'updated_at DESC', name: '更新が新しい順'},
    {code: 'updated_at ASC', name: '更新が古い順'}
  ]
end