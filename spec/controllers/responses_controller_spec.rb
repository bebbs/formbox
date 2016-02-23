require 'rails_helper'

RSpec.describe ResponsesController, type: :controller do
  describe 'POST f/:uuid' do
    context 'Form does not exist' do
      it '422 Unprocessable entity' do
        post :create, uuid: '23678'
        
        expect(response.status).to eq 422
      end
    end
    
    context 'Form exists' do
      before(:each) do
        @form = FactoryGirl.create(:form)
      end
      
      it '302 redirects (ok)' do
        post :create, uuid: @form.uuid
        
        expect(response.status).to eq 302
      end
      
      it 'Redirects to the redirect_url of the form' do
        post :create, uuid: @form.uuid
        
        expect(response).to redirect_to "https://google.com"
      end
      
      it 'Response gets created' do        
        post :create, {uuid: @form.uuid, location: 'Leeds', name: 'John Doe'}
        
        expect(@form.responses.count).to eq 1
      end
    end
    
  end
end