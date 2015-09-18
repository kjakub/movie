require 'rails_helper'

feature 'User signs in' do

  scenario 'with valid credentials' do
    visit root_path
    click_on 'Sign up'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '12345678' 
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end