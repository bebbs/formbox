require 'rails_helper'

RSpec.describe FormsController, type: :controller do
  describe 'GET /forms/new' do
    it '302 when not signed in' do
      get :new, {}
      
      expect(response.status).to eq 302
    end
    
    it 'Returns the new form page when signed in' do
      user = FactoryGirl.create(:user)
      sign_in user
      get :new, {}
      
      expect(response.status).to eq 200
    end
  end
  
  describe 'POST /forms' do
    it '302 when not signed in' do
      post :create, {}
      
      expect(response.status).to eq 302
    end
    
    it 'Success when signed in' do
      user = FactoryGirl.create(:user)
      sign_in user
      post :create, form: FactoryGirl.attributes_for(:form)
      
      expect(response).to redirect_to '/dashboard'
    end
  end
end