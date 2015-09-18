require 'rails_helper'

feature 'User signs in' do

  before do
  	FactoryGirl.create(:user)
  end

  scenario 'with valid credentials' do
    visit root_path
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '12345678' 
    click_on 'Sign in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'with in valid credentials' do
    visit root_path
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '12345' 
    click_on 'Sign in'
    expect(page).to have_content('Invalid email or password.')
  end

end