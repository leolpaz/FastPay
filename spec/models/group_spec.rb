require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) {
    @u = User.new(name: 'test', password: 'testpass', email: 'test@test.com')
    @u.save
    @g = @u.groups.new(name: 'test', icon: 'food') 
  }
  it 'name should be present' do
    expect(@g).to be_valid
    @g.name = nil
    expect(@g).to_not be_valid
  end
  it 'icon should be present' do
    expect(@g).to be_valid
    @g.icon = nil
    expect(@g).to_not be_valid
  end
  it 'should belong to an user' do
    expect(@g).to be_valid
    @g = Group.new(name: 'test', icon: 'food') 
    expect(@g).to_not be_valid
  end
end
