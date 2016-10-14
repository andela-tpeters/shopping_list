class AddBudgetToShoppingLists < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_lists, :budget, :integer
  end
end
