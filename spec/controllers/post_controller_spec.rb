require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PostsController, type: :controller do
  describe 'GET users#index' do
    login_user
    
    context "get posts and render index page" do
      it 'gets all posts' do
        get :index
        expect(response).to be_successful
        expect(response).to render_template(:index)
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST users#create' do
    context 'with valid parameters' do
      let(:post) { content: 'John doe, it\'s your first time here' }
       
      login_user
      it 'creates a new post and renders index page' do
        user = FactoryBot.create(:user)
        
        expect(response).to be_successful
        expect { post "/posts_path", params: valid_params }.to change(Post, :count).by(+1)
        expect(response).to have_http_status (:created)
        expect(response).to redirect_to(posts_path)
      end
    end

    context 'with invalid parameters' do
      let(:post) { content: ''  }
      login_user
      it 'renders a new template' do
        expect(response).to render_template(:index)    
      end
    end
  end
end