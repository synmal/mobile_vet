require 'rails_helper'

RSpec.describe Pet, type: :model do
  context 'When creating new pet' do
    it 'returns error on empty name' do
      user = User.first
      pet = user.pets.new(type: 'cat')
      expect{ pet.save }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'returns error on empty type' do
      user = User.first
      pet = user.pets.new(name: 'jojo')
      expect{ pet.save }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should have owner id on create' do
      user = User.first
      pet = user.pets.new(name: 'jojo', type: 'cat')
      pet.save
      expect(pet.user).to eq(user)
    end
  end
end
