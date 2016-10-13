require 'rails_helper'

RSpec.describe ShoppingListsController, type: :controller do
  describe '#new' do
    it "renders a shopping list page" do
      get :new
      expect(response).to render_template :new
      expect(assigns(:shopping_list)).not_to be_nil
    end
  end
end
