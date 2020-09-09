require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(id: 1, name: 'john doe', email: 'johndoe@yahoo.com', password: 'johndoe')
    @post = Post.create( user_id: @user.id, content: 'Hello world, it\'s johnny')
    @comment = Comment.create(user_id: @user.id, post_id: @post.id, content: 'New incoming message!!!')
  end

  context 'Comment Validations' do
    it 'accepts valid attributes' do
      expect(@comment).to be_valid
    end

    it 'accepts a text' do
      expect(@comment.content).to be_present
    end 
  end

  context 'ActiveRecord Comment Associations' do
    it { should belong_to(:post) } 
    it { should belong_to(:user) } 
  end
end
