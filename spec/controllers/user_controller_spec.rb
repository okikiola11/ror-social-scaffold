require 'rails_helper'
require_relative '../support/devise'

RSpec.describe UsersController, type: :controller do
  describe 'GET users#index' do
    login_user

    context "get users and render index page" do
      it 'gets all users' do
        get :index
        expect(response).to be_successful
        expect(response).to render_template(:index)
        expect(response).to have_http_status(:success)
      end
    end
    
  end

  describe 'GET users#show' do
    let(:user) { FactoryBot.create(:user) }

    context "get a single user" do
      login_user

      it 'displays the user show page' do
        get 'show', params: {id: user.id}
        expect(response).to be_successful
        expect(response).to render_template(:show)
        expect(response).to have_http_status(200)
      end
    end
  end
end