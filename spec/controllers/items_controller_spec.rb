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

    describe '#create' do
      context 'when task validates' do
        it "creates a new item record" do
          post :create, params: {task: "Buy Milk", id: @shopping_list.id}
          expect(response).to redirect_to items_path
          expect(session["flash"]["flashes"]["notice"]).to eq "Item created"

          expect(Item.all.size).to eq 1
          expect(@shopping_list.items.size).to eq 1
        end
      end

      context 'when task does not validate' do
        it "renders the new template" do
          post :create, params: { task: "", id: @shopping_list.id }
          expect(response).to render_template :new
          expect(session["flash"]["flashes"]["notice"]).to eq "Item not created"
        end
      end
    end

    describe '#index' do
      context 'when there are no items for a shopping list' do
        it "returns array of size 0" do
          get :index, params: {id: @shopping_list.id}
          expect(assigns(:items).size).to eq 0
          expect(response).to render_template :index
        end
      end

      context 'when there are items for a shopping list' do
        it "returns array of items" do
          5.times { create :item }
          get :index, params: { id: @shopping_list.id }
          expect(assigns(:items).size).to eq 5
          expect(assigns(:items)[0].id).to eq @shopping_list.id
        end
      end
    end
  end
end
