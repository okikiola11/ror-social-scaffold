require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ActiveModel Validations' do
    subject do 
      described_class.new(
        name: 'john',
        email: 'johndoe@yahoo.com',
        password: 'johnny'
      )
    end

    
  end
end