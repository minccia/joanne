require 'rails_helper'

describe 'User visits homepage' do
  it 'and sees initial text' do
    visit root_path

    expect(page).to have_content('Hello, i\'m a dynamic text.')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
  end

  it 'and sees text from turbo frame after clicking the button' do
    visit root_path

    click_on 'Click to change the text'

    expect(page).to have_content('I\'m a new text!')
  end
end
