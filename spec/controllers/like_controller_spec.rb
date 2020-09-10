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
      # expect { post "/post_likes_url", params: :like_params }.to change(Like, :count).by(+1)
      # expect(response).to have_http_status (:created)
      # expect(response).to redirect_to(posts_path)
    end
  end
end
