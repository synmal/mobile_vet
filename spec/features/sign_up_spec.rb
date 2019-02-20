require 'rails_helper'

describe "the sign up process", type: :feature do
  it "signs me up" do
    visit '/users/new'
    within("form") do
      fill_in 'user[name]', with: 'John Smith'
      fill_in 'user[email]', with: 'john.smith@example.com'
      fill_in 'user[address]', with: 'Lot 123, Random Address'
      fill_in 'user[phone]', with: '+60123456789'
      fill_in 'user[password]', with: '"this@is@a@stong@password"'
    end
    click_button 'Sign Up'
    expect(page).to have_content 'Log Out'
  end

  it "returns me back if not meet User model validations" do
    visit '/users/new'
    within("form") do
      fill_in 'user[name]', with: 'John Smith'
      fill_in 'user[email]', with: 'john.smith@example.com'
      fill_in 'user[address]', with: 'Lot 123, Random Address'
      fill_in 'user[password]', with: '"this@is@a@stong@password"'
    end
    click_button 'Sign Up'
    expect(page).to have_content 'Log In'
  end
end