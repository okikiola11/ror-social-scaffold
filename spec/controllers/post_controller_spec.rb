require 'rails_helper'
require_relative '../support/devise'

RSpec.describe PostsController, type: :controller do
  describe 'GET users#index' do
    login_user

    context 'get posts and render index page' do
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
      login_user
      it 'creates a new post and renders redirects to the Post\'s page' do
        get :index
        expect(response).to render_template(:index)
        post :create, params: { post: { user_id: '1', content: 'Hello World' } }
        expect(response).to redirect_to(assigns(:posts))
        expect(response.body).to include('You are being')
      end
    end

    context 'with invalid parameters' do
      login_user
      it 'renders a new template' do
        get :index
        expect(response).to render_template(:index)
        post :create, params: { post: { user_id: '1', content: '' } }
        expect(response).to render_template(:index)
        expect(response.body).to eq('')
      end
    end
  end
end
