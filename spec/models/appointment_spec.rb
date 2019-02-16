require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it 'should have valid description' do
    expect{ create(:appointment, description: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should have valid appointment date' do
    expect{ create(:appointment, appointment_date: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should have valid location' do
    expect{ create(:appointment, location: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should have appointment stauts of false by default' do
    appointment = build(:appointment)
    appointment.save
    expect(appointment.appointment_status).to eq(false)
  end
end
