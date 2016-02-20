require 'rails_helper'

describe 'Forms' do
  context 'On the dashboard' do
    before(:each) do      
      user = login_user
      Form.create(name: 'Test form', user: user)
      Form.create(name: 'Second form', user: user)
    end

    it 'Lists forms' do
      visit '/dashboard'
      
      expect(page).to have_content('Test form')
      expect(page).to have_content('Second form')
    end

    it 'Doesn\'t list other users forms' do 
      other_user = FactoryGirl.create(:user)
      Form.create(name: 'Other users form', user: other_user)
      visit '/dashboard'
      
      expect(page).to have_content('Test form')
      expect(page).not_to have_content('Other users form')
    end
  end
end