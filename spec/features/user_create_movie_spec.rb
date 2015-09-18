# spec/features/user_sign_in_spec.rb

require 'rails_helper'

feature 'User create film', js: true do

  before do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  scenario 'create valid movie'  do
    visit new_film_path
    fill_in 'film_title', with: 'Movie title'
    file_field = page.find('.file_upload')
    page.attach_file(file_field[:name], File.absolute_path('./spec/factories/sample.jpg'))
    click_on 'Create'
    expect(page).to have_content('Film was successfully created.')
  end

end