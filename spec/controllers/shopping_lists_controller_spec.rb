require 'rails_helper'

RSpec.describe ShoppingListsController, type: :controller do

  context 'when user is logged in' do
    before(:each) do
      user = create :user
      session[:user_id] = user.id
    end

    describe '#new' do
      it "renders a shopping list page" do
        get :new
        expect(response).to render_template :new
        expect(assigns(:shopping_list)).not_to be_nil
      end
    end

    describe '#create' do
      context "when attributes validate" do
        it "redirects_to to shopping index page" do
          post :create, params: { title: "First" }
          expect(session["flash"]["flashes"]["notice"]).to eq "Shopping List created"
          expect(response).to redirect_to shopping_lists_index_path
        end
      end

      context 'when attributes does not validate' do
        it "renders the new template" do
          post :create, params: {title: ""}
          expect(response).to render_template :new
          expect(session["flash"]["flashes"]["notice"]).to eq "Shopping list creation failed"
        end
      end
    end

    describe '#index' do
      context 'when shopping lists is empty' do
        it "returns empty lists" do
          get :index
          expect(response).to render_template :index
          expect(assigns(:shopping_lists)).to eq []
        end
      end

      context 'when there are shopping lists' do
        before do
          5.times { create(:shopping_list) }
        end
        it "returns an array of shopping lists" do
          get :index
          shopping_lists = assigns(:shopping_lists)
          expect(shopping_lists.empty?).to be_falsey
          expect(shopping_lists.size).to eq 5
        end
      end
    end
  end

  context 'when user is not logged' do
    it "redirect to login page" do
      post :create, params: { title: "First" }
      expect(response).to redirect_to login_path
    end
  end

end
