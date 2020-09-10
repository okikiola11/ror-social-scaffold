require 'rails_helper'
require_relative '../support/devise'

RSpec.describe LikesController, type: :controller do
  
  login_user
  let(:user) { FactoryBot.create(:user)}
  let(:post) { Post.create(user_id: user.id, content: 'New Post') }

  describe 'POST likes#create' do    
    it 'allows user to like a post' do
      like_params = { post_id: post.id, user_id: user.id }
      expect(response).to be_successful
    end
  end
end
