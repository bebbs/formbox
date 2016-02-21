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
  
  context 'Creating a form' do
    before(:each) do
      user = login_user
      visit '/dashboard'
      page.first('.new-form-link').click
    end
    
    it 'Can navigate to the new form page' do
      expect(page).to have_content('New Form')
    end
    
    it 'Can submit a valid new form' do
      fill_in(:form_name, with: 'Contact form')
      fill_in(:form_redirect_url, with: 'https://www.google.com')
      click_button('Create Form')
      
      expect(page).to have_content('Form was successfully created')
      expect(page).to have_content('Contact form')
    end
  end
  
  context 'Archiving a form' do
    it 'Using the archive button' do
      user = login_user
      Form.create(name: "Contact form", user: user)
      visit '/dashboard'
      within("li.form-card") do
        click_link "Archive"
      end
      
      expect(current_path).to eq "/dashboard"
      expect(page).to have_content('Contact form is now archived')
    end
  end
end