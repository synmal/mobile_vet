require 'rails_helper'

RSpec.describe Appointment, type: :model do

  it 'should create appointment with valid inputs' do
    expect(create(:appointment)).to be_valid
  end

  it 'should have description' do
    expect{ create(:appointment, description: '') }.to raise_error('Validation failed: Description can\'t be blank')
  end

  it 'should have location' do
    expect{ create(:appointment, location: '') }.to raise_error('Validation failed: Location can\'t be blank')
  end

  it 'should have appointment date' do
    expect{ create(:appointment, appointment_date: '') }.to raise_error('Validation failed: Appointment date can\'t be blank')
  end

  it 'should have time' do
    expect{ create(:appointment, time: '') }.to raise_error('Validation failed: Time can\'t be blank')
  end

  it 'should have user' do
    appointment = create(:appointment)
    expect(appointment.user.name).to eq('John Smith')
  end

  it 'should have pet' do
    appointment = create(:appointment)
    expect(appointment.pet.name).to eq('Chico')
  end

  it 'should belongs to user' do
    expect(Appointment.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'should belongs to pet' do
    expect(Appointment.reflect_on_association(:pet).macro).to eq(:belongs_to)
  end
end
