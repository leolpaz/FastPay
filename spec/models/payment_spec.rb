require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:each) {
    @u = User.new(name: 'test', password: 'testpass', email: 'test@test.com')
    @u.save
    @p = @u.payments.new(name: 'test', amount: 100) 
  }
  it 'name should be present' do
    expect(@p).to be_valid
    @p.name = nil
    expect(@p).to_not be_valid
  end
  it 'amount should be present' do
    expect(@p).to be_valid
    @p.amount = nil
    expect(@p).to_not be_valid
  end
  it 'should belong to an author' do
    expect(@p).to be_valid
    @p = Payment.new(name: 'test', amount: 100) 
    expect(@p).to_not be_valid
  end
end
