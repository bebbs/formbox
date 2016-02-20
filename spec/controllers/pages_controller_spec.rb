require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET /' do
    it 'Returns the homepage' do
      get :home, {}
      expect(response.status).to eq 200
    end
  end
end