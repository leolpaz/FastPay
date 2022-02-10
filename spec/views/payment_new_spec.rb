require 'rails_helper'

RSpec.describe 'Payment new', type: :feature do
  before(:each) do
    visit user_session_path
    @u = User.create(name: 'Test', email: 'test@test.com', password: '123456')
    @g1 = @u.groups.create(name: 'test1', icon: 'food')
    @g2 = @u.groups.create(name: 'test2', icon: 'games')
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'test1'
    click_button 'CREATE NEW TRANSACTION'
  end
  describe 'tests the payment new page' do
    it 'can see the nav bar' do
      expect(page).to have_content "NEW TRANSACTION"
    end
    it 'can see the name field' do
      expect(page).to have_field 'Name'
    end
    it 'can see the amount field' do
      expect(page).to have_field 'Name'
    end
    it 'can see the categories field' do
      expect(page).to have_content 'SELECT CATEGORIES'
      expect(page).to have_selector "input", :id => "groups_payment_group_ids_#{@g1.id}"
      expect(page).to have_selector "input", :id => "groups_payment_group_ids_#{@g2.id}" 
    end
    it 'can create a new category' do
      fill_in 'Name', with: 'A new transaction'
      fill_in 'Amount', with: 25
      check :id => "groups_payment_group_ids_#{@g1.id}"
      check :id => "groups_payment_group_ids_#{@g2.id}"
      click_button 'Save'
      expect(page).to have_current_path(group_payments_path(@g1.id))
      expect(page).to have_content 'Your new transaction has been created'
      expect(page).to have_content 'A new transaction' 
    end
  end
end
