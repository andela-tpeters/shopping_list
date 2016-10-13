require 'rails_helper'

RSpec.describe LandingsController, type: :controller do
  describe "#index" do
    it 'loads the index page' do
      get :index
      expect(response).to render_template :index
    end
  end
end
