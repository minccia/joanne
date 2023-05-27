require 'rails_helper'

describe 'User sign in' do
  it 'through homepage' do
    FactoryBot.create(
      :user, email: 'fortests@email.com',
             password: '123456'
    )

    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: 'fortests@email.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(current_path).to eq root_path
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_button('Sign out')
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end

  it 'and log out' do
    user = FactoryBot.create(
      :user, email: 'fortests@email.com',
             password: '123456'
    )

    login_as user
    visit root_path
    click_on 'Sign out'

    expect(current_path).to eq root_path
    expect(page).to have_content('Signed out successfully')
    expect(page).not_to have_button('Sign out')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end

  it 'and fill the fields with wrong information' do
    FactoryBot.create(
      :user, email: 'fortests@email.com',
             password: '123456'
    )

    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: 'ablablalbalbalbalba@hahahaha'
    fill_in 'Password', with: 'pepepeppepepepe'
    click_on 'Log in'

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content('Invalid Email or password.')
    expect(page).not_to have_button('Sign out')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end
end
