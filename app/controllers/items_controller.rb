class ItemsController < ApplicationController
  before_action :current_user
  before_action :shopping_list

  def index
    @items = @shopping_list.items
  end

  def new
    @item = @shopping_list.items.new
  end

  def create
    @item = @shopping_list.items.create allowed
    if @item.errors.empty?
      flash[:notice] = "Item created"
      redirect_to items_path
    else
      flash[:notice] = "Item not created"
      render :new
    end
  end

  private

  def allowed
    params.permit :task
  end

  def shopping_list
    @shopping_list = current_user.shopping_lists.find_by(id: params[:id])
    redirect_to(items_path) && return if @shopping_list.nil?
    @shopping_list
  end
end
