require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#new' do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    context "when user details validates" do
      it "creates a new user record" do
        post :create, params: {email: "confirm@gmail.com", password: "password", password_confirmation: "password"}
        expect(session["flash"]["flashes"]["notice"]).to eq "Registration Successful"
        expect(session["user_id"]).to eq User.last.id
        expect(response).to redirect_to root_path
      end
    end

    context 'when user details does not validate' do
      it "renders the new page" do
        post :create, params: {email: "confirm@gmail.com", password: "password", password_confirmation: ""}
        expect(session["flash"]["flashes"]["notice"]).to eq "Registration Failed"
        expect(response).to render_template :new
      end
    end
  end
end
