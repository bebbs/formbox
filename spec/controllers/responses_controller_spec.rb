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
      it '302 redirects (ok)' do
        form = FactoryGirl.create(:form)
        post :create, uuid: form.uuid
        
        expect(response.status).to eq 302
      end
    end
    
  end
end