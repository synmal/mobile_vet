require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates new user with valid data' do
    expect(create(:user)).to be_valid
  end

  it 'should have a name' do
    expect{ create(:user, name: '') }.to raise_error('Validation failed: Name can\'t be blank')
  end

  it 'should have a address' do
    expect{ create(:user, address: '') }.to raise_error('Validation failed: Address can\'t be blank')
  end

  it 'should have a email' do
    expect{ create(:user, email: '') }.to raise_error('Validation failed: Email can\'t be blank, Email is invalid')
  end

  it 'should have a password' do
    expect{ create(:user, password: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should have a phone number' do
    expect{ create(:user, phone: '') }.to raise_error('Validation failed: Phone can\'t be blank')
  end

  it 'should have password length more than 8 characters' do
    expect{ create(:user, password: '1234567') }.to raise_error('Validation failed: Password is too short (minimum is 8 characters)')
  end

  it 'should have many appointments' do
    expect(User.reflect_on_association(:appointments).macro).to eq(:has_many)
  end

  it 'should have many pets' do
    expect(User.reflect_on_association(:pets).macro).to eq(:has_many)
  end

  it 'should have role of user by default' do
    user = create(:user)
    expect(user.roles).to eq('user')
  end

  it 'should have unique email' do
    user = create(:user)
    expect{ create(:user, email: user.email) }.to raise_error('Validation failed: Email has already been taken')
  end

  it 'should have proper email' do
    expect{ create(:user, email: 'asd') }.to raise_error('Validation failed: Email is invalid')
  end
end
