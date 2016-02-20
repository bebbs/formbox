require 'rails_helper'

describe 'Logged out user' do
  context 'On the homepage' do  
    before :each do 
      visit('/')
    end
    
    it 'Is logged out by default' do
      expect(page).not_to have_link 'Log out'
    end
    
    it 'Can see the link to login' do      
      expect(page).to have_link 'Log in'
    end
    
    it 'Can navigate to the login page' do
      click_link 'Log in'
      
      expect(current_path).to eq '/users/sign_in'
    end
  end
  
  context 'Logging in' do
    
    it 'Can log in' do
      login_user
      
      expect(page).to have_content('Signed in successfully')
    end
  end
  
end

describe 'Logged in user' do
  it 'Can log out' do
    login_user
    click_link 'Log out'
    
    expect(page).to have_content('Signed out successfully')
  end
end

def login_user
  user = FactoryGirl.create(:user)
  visit '/users/sign_in'
  fill_in(:user_email, with: 'test@example.com')
  fill_in(:user_password, with: 'abc1234@')
  click_button('Log in')
end