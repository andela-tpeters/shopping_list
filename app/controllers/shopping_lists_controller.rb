class ShoppingListsController < ApplicationController
  def new
    @shopping_list = ShoppingList.new
  end
end
