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

  
end