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

    it 'is valid with valid attributes' do
      subject.name = 'john'
      subject.email = 'johndoe@yahoo.com'
      subject.password = 'johnny'
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  
    it 'is not valid with name less than 3 characters' do
      subject.name = 'jo'
      expect(subject).to_not be_valid
    end

    it 'is not valid with name greater than 20 characters' do
      subject.name = 'john doe okikiola williams sam'
      expect(subject).to_not be_valid
    end
  end
end