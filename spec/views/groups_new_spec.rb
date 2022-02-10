require 'rails_helper'

RSpec.describe 'Group new', type: :feature do
  before(:each) do
    visit user_session_path
    @test1 = User.create(name: 'Test', email: 'test@test.com', password: '123456')
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_button 'CREATE NEW CATEGORY'
  end
  describe 'tests the group new page' do
    it 'can see the nav bar' do
      expect(page).to have_content 'NEW CATEGORY'
    end
    it 'can see the name field' do
      expect(page).to have_field 'Name'
    end
    it 'can see the icons field' do
      expect(page).to have_content 'Select icon'
      expect(page).to have_selector "input", :id => 'group_icon_money' 
      expect(page).to have_selector "input", :id => 'group_icon_food' 
      expect(page).to have_selector "input", :id => 'group_icon_games' 
      expect(page).to have_selector "input", :id => 'group_icon_drinks' 
    end
    it 'can create a new category' do
      fill_in 'Name', with: 'A new category'
      choose :id => 'group_icon_money'
      click_button 'Save'
      expect(page).to have_current_path(groups_path)
      expect(page).to have_content 'Your new category has been created'
      expect(page).to have_content 'A new category'
    end
  end
end
