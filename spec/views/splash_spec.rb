require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  before(:each) do
    visit root_path
  end
  describe 'tests the show post page' do
    it "can see the pages title" do
      expect(page).to have_content 'FastPay'
    end
    it "can see the login button" do
      expect(page).to have_button 'LOG IN'
    end
    it "can see the sign up button" do
      expect(page).to have_button 'SIGN UP'
    end
    it "can go to the login page" do
      click_link 'LOG IN'
      expect(page).to have_current_path(user_session_path)
    end
    it "can go to the signup page" do
      save_and_open_page
      click_link 'SIGN UP'
      save_and_open_page
      expect(page).to have_current_path(new_user_registration_path)
    end
  end
end
