require 'rails_helper'
require_relative '../support/devise'

RSpec.describe LikesController, type: :controller do
  login_user
  describe 'POST likes#create' do
    it 'allows user to like a post' do
      expect(response).to be_successful
    end
  end
end
