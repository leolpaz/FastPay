require 'rails_helper'

RSpec.describe 'Payment Index', type: :feature do
  before(:each) do
    visit user_session_path
    @u = User.create(name: 'Test', email: 'test@test.com', password: '123456')
    @g = @u.groups.create(name: 'test1', icon: 'food')
    @p1 = @u.payments.create(name: 'chocolate', amount: '5')
    @p2 = @u.payments.create(name: 'rice', amount: '3')
    @p1.groups_payments.create(group_id: @g.id)
    @p2.groups_payments.create(group_id: @g.id)
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link 'test1'
  end
  describe 'tests the payments index page' do
    it 'can see the nav bar' do
      expect(page).to have_content 'TRANSACTIONS FOR TEST1'
    end
    it 'can see the sum of all payments' do
      expect(page).to have_content 'Total:'
      expect(page).to have_content '$8.0'
    end
    it 'can see the name of all payments' do
      expect(page).to have_content 'chocolate'
      expect(page).to have_content 'rice'
    end
    it 'can see the value of all payments' do
      expect(page).to have_content '$5.0'
      expect(page).to have_content '$3.0'
    end
    it 'can see the button to create a new transaction' do
      expect(page).to have_button 'CREATE NEW TRANSACTION'
    end
    it 'redirects you to the new transaction page' do
      click_button 'CREATE NEW TRANSACTION'
      expect(page).to have_current_path(new_group_payment_path(@g.id))
    end
  end
end
