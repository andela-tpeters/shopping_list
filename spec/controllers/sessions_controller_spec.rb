require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "#signin" do
    context "when user does not exist" do
      it "redirects back login with flash" do
        post :signin, params: { user: {email: "john@example.com", password: "password"}}
        expect(response).to render_template :new
      end
    end

    context "when user exists" do
      it "sets session and redirects to index" do
        create :user
        post :signin, params: {user: {email: "correct@gmail.com",password:"password"}}
        expect(response).to redirect_to root_path
      end
    end
  end
end
