class RemoveIconFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :icon, :string
  end
end
