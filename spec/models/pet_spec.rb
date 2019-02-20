require 'rails_helper'

RSpec.describe Pet, type: :model do

    it 'creates a pet with valid input' do
      expect(create(:pet)).to be_valid
    end

    it 'should have name' do
      expect{ create(:pet, name: '') }.to raise_error('Validation failed: Name can\'t be blank')
    end

    it 'should have pet type' do
      expect{ create(:pet, pet_type: '') }.to raise_error('Validation failed: Pet type can\'t be blank')
    end

    it 'should have breed' do
      expect{ create(:pet, breed: '') }.to raise_error('Validation failed: Breed can\'t be blank')
    end

    it 'should have age' do
      expect{ create(:pet, age: '') }.to raise_error('Validation failed: Age can\'t be blank')
    end

    it 'should have user' do
      pet = create(:pet)
      expect(pet.user.name).to eq('John Smith')
    end

    it 'should belongs to user' do
      expect(Pet.reflect_on_association(:user).macro).to eq(:belongs_to)
    end

    it 'should have_many appointmnets' do
      expect(Pet.reflect_on_association(:appointments).macro).to eq(:has_many)
    end

end
