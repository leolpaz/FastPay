require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  before(:each) do
    visit user_session_path
    User.create(name: 'Test', email: 'test@test.com', password: '123456')
  end
  describe 'tests the login page' do
    it 'has username and password inputs and log in button' do
      expect(page).to have_field 'Email'
      expect(page).to have_field 'Password'
      expect(page).to have_button 'Log in'
    end
    it 'shows detailed error when logging in without username and password' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
    it 'displays an error with the wrong username or password' do
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '123457'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
      fill_in 'Email', with: 'testttt@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end
    it 'send the user to the root path if the login information is correct' do
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_current_path(groups_path)
    end
  end
end
