class ItemsController < ApplicationController
  before_action :current_user

  def new
    @item = current_user.shopping_lists.items.new
  end
end
