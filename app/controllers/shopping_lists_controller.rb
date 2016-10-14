class ShoppingListsController < ApplicationController
  before_action :current_user

  def index
    @shopping_lists = @user.shopping_lists
  end

  def new
    @shopping_list = ShoppingList.new
  end

  def create
    @shopping_list = (@user.shopping_lists.create(allowed) if @user) || nil
    if @shopping_list.errors.empty?
      flash[:notice] = "Shopping List created"
      redirect_to shopping_lists_index_path
    else
      flash[:notice] = "Shopping list creation failed"
      render :new
    end
  end

  private

  def allowed
    params.permit(:title, :budget)
  end
end
