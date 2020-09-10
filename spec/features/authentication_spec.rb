require 'rails_helper'
require_relative '../support/devise'

RSpec.describe 'Creating new user', type: :feature do
  scenario 'valid inputs' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Alice'
    fill_in 'Email', with: 'alice@alice.com'
    fill_in 'Password', with: 'asdfgh'
    fill_in 'Password confirmation', with: 'asdfgh'
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'invalid inputs' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Alice'
    fill_in 'Email', with: 'alice@alice.com'
    fill_in 'Password', with: 'asdfgh'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end

RSpec.describe 'sign in as a non-existing user', type: :feature do
  before(:example) do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')
    fill_in 'Name', with: 'Alice'
    fill_in 'Email', with: 'alice@alice.com'
    fill_in 'Password', with: 'asdfgh'
    fill_in 'Password confirmation', with: 'asdfgh'
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    click_on 'Sign out'
  end
  scenario 'existing user' do
    visit new_user_session_path
    fill_in 'Email', with: 'alice@alice.com'
    fill_in 'Password', with:'asdfgh'
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'non existing user' do
    visit new_user_session_path
    fill_in 'Email', with: 'user@invalid.com'
    fill_in 'Password', with:'example'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
