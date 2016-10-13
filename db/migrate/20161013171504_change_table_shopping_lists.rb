class ChangeTableShoppingLists < ActiveRecord::Migration[5.0]
  def change
    add_reference :shopping_lists, :user
  end
end
