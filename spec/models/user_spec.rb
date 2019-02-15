require 'rails_helper'

RSpec.describe User, type: :model do
  context 'sign up with same email' do
    it 'should give error' do
        user1 = User.create!(email: 'test@example.com', name: 'John Smith', address: 'test')
        expect{ User.create!(email: 'test@example.com', name: 'John Smith', address: 'test') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'sign up with empty fields' do
    it 'should have name' do
      expect{ User.create!(email: '1@example.com', address: 'test') }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'should have email' do
      expect{ User.create!(name: 'John Smith', address: 'test') }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it 'should have address' do
      expect{ User.create!(name: 'John Smith', email: '1@example.com') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'should have default role = 1' do
    it 'should have role = 1' do
      user = User.create!(email: 'test@example.com', name: 'John Smith', address: 'test')
      expect(user.roles).to eq 1
    end
  end
end
