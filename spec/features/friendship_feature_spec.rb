require 'rails_helper'
require_relative '../support/devise'

RSpec.describe 'Send Friend Invitation', type: :feature do
  before(:each) do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')
    fill_in 'Name', with: 'Alice'
    fill_in 'Email', with: 'alice@alice.com'
    fill_in 'Password', with: 'asdfgh'
    fill_in 'Password confirmation', with: 'asdfgh'
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    click_on 'Sign out'

    visit new_user_registration_path
    expect(page).to have_content('Sign up')
    fill_in 'Name', with: 'Bob'
    fill_in 'Email', with: 'bob@bob.com'
    fill_in 'Password', with: 'bobbob'
    fill_in 'Password confirmation', with: 'bobbob'
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'can see list of all users' do
    click_on 'All users'
    expect(page).to have_content('Invite to Friendship')
  end

  scenario 'can invite other users for friendship' do
    click_on 'All users'
    click_on 'Invite to Friendship'
    expect(page).to have_content('Friend request sent successfully!')
  end
  scenario 'cannot invite other users for friendship multiple times' do
    click_on 'All users'
    click_on 'Invite to Friendship'
    expect(page).to_not have_content('Invite to Friendship')
  end

  scenario 'can see friendhsip invitations from other users' do
    click_on 'All users'
    page.all('a', text: 'See Profile')[1].click
    expect(page).to have_content('Friend requests received from:')
  end

  scenario 'can see options for accept or reject friendship invitation' do
    click_on 'All users'
    click_on 'Invite to Friendship'
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'Email', with: 'alice@alice.com'
    fill_in 'Password', with: 'asdfgh'
    click_on 'Log in'
    click_on 'All users'
    page.all('a', text: 'See Profile')[0].click
    expect(page).to have_button('Accept')
    expect(page).to have_button('Reject')
  end

  scenario 'can accept the friend request' do
    click_on 'All users'
    click_on 'Invite to Friendship'
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'Email', with: 'alice@alice.com'
    fill_in 'Password', with: 'asdfgh'
    click_on 'Log in'
    click_on 'All users'
    page.all('a', text: 'See Profile')[0].click
    page.all('a', text: 'Accept')[0].click
    expect(page).to have_content('You are now friend with')
  end

  scenario 'can reject the friend request' do
    click_on 'All users'
    click_on 'Invite to Friendship'
    click_on 'Sign out'
    visit new_user_session_path
    fill_in 'Email', with: 'alice@alice.com'
    fill_in 'Password', with: 'asdfgh'
    click_on 'Log in'
    click_on 'All users'
    page.all('a', text: 'See Profile')[0].click
    page.all('a', text: 'Reject')[0].click
    expect(page).to have_content('You rejected')
  end
end
