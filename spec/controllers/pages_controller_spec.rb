require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET /' do
    it 'Returns the homepage' do
      get :home, {}
      expect(response.status).to eq 200
    end
  end
  
  describe 'GET /dashboard' do
    it '302 when not signed in' do
      get :dashboard, {}
      
      expect(response.status).to eq 302
    end
    
    it 'Returns the dashboard when signed in' do
      user = FactoryGirl.create(:user)
      sign_in user
      get :dashboard, {}
      
      expect(response.status).to eq 200
    end
  end
end