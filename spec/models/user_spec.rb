require 'rails_helper'

RSpec.describe User, type: :model do
  context 'sign up with same email' do
    it 'should give error' do
        user1 = User.create!(email: 'test@example.com')
        expect(User.create!(email: 'test@example.com')).to raise_error
    end
  end

  context 'should have default role = 1' do
    it 'should have role = 1' do
      user = User.create!
      expect(user.roles).to eq 1
    end
  end
end
