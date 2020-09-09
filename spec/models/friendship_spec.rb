require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before :each do
    @user = User.create(id: 1, name: 'john doe', email: 'johndoe@yahoo.com', password: 'johndoe')
    @user2 = User.create(id: 2, name: 'mary doe', email: 'marydoe@yahoo.com', password: 'marydoe')
    @friendship = Friendship.create(user_id: @user.id, friend_id: @user2.id, confirmed: false)
  end

  scenario 'is valid with valid frendship attributes' do
    expect(@friendship).to be_valid
  end

  scenario 'should create an inverse friendship' do
    expect(@user2.inverse_friendships).not_to be_empty 
  end

  context 'Active Model Friendship Associations' do
    it { should belong_to :friend } 
    it { should belong_to :user } 
  end
end