require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  context 'when user is logged in' do
    before do
      @user = create :user
      session[:user_id] = @user.id
      @shopping_list = create :shopping_list
    end
    describe "#new" do
      it "renders the new template for new item" do
        get :new, params: {id: @shopping_list.id}
        expect(response).to render_template :new
        expect(assigns(:item)).to be_kind_of Item
      end
    end
  end
end
