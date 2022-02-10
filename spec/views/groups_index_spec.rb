require 'rails_helper'

RSpec.describe 'Group Index', type: :feature do
  before(:each) do
    visit user_session_path
    @test1 = User.create(name: 'Test', email: 'test@test.com', password: '123456')
    @g1 = @test1.groups.create(name: 'test1', icon: 'food')
    @g2 = @test1.groups.create(name: 'test2', icon: 'drinks')
    @g3 = @test1.groups.create(name: 'test3', icon: 'games')
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end
  describe 'tests the group index page' do
    it 'can see the nav bar' do
      expect(page).to have_content 'CATEGORIES'
    end
    it 'can see the title of all groups' do
      expect(page).to have_content 'test1'
      expect(page).to have_content 'test2'
      expect(page).to have_content 'test3'
    end
    it 'can see the picture of all other users' do
      expect(page.find(:xpath, '/html/body/div/div/ul/a[1]/li/img')['src']).to have_content 'food'
      expect(page.find(:xpath, '/html/body/div/div/ul/a[2]/li/img')['src']).to have_content 'drinks'
      expect(page.find(:xpath, '/html/body/div/div/ul/a[3]/li/img')['src']).to have_content 'games'
    end
    it 'can see the number of transactions each group has' do
      expect(page.find(:xpath, '/html/body/div/div/ul/a[1]/li/div/h3')).to have_content 'Transactions: 0'
      expect(page.find(:xpath, '/html/body/div/div/ul/a[2]/li/div/h3')).to have_content 'Transactions: 0'
      expect(page.find(:xpath, '/html/body/div/div/ul/a[3]/li/div/h3')).to have_content 'Transactions: 0'
    end
    it 'redirects you to the new category page' do
      click_button 'CREATE NEW CATEGORY'
      expect(page).to have_current_path(new_group_path)
    end
  end
end
