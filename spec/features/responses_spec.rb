require 'rails_helper'

describe 'Responses' do
  context 'Forms list on the dashboard' do
    before(:each) do
      user = login_user
      @form = Form.create(name: 'Contact us', user: user)
    end
    
    it 'Displays no responses by default' do
      visit '/dashboard'
      
      expect(page).to have_content('0 Responses')
    end
    
    it 'Displays the number of responses' do
      @form.responses.create
      visit '/dashboard'
      
      expect(page).to have_content('1 Response')
    end
    
    it 'Can pluralize responses' do
      2.times {@form.responses.create}
      visit '/dashboard'
      
      expect(page).to have_content('2 Responses')
    end
  end
end