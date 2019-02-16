require 'rails_helper'

RSpec.describe Pet, type: :model do

  context 'When creating new pet' do
    it 'returns error on empty name' do
      expect{ Pet.create!(pet_type: 'cat') }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'returns error on empty type' do
      expect{ Pet.create!(name: 'jojo') }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should have owner id on create' do
      pet = build(:pet)
      expect(pet.user).to_not eq(nil)
    end
  end
end
