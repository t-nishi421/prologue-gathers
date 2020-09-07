class RemoveColorFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :color, :string
  end
end
