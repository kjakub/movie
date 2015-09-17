require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end


  it 'sign up and redirect' do
    post :create, user: attributes_for(:user)
    expect(response).to redirect_to(films_path)
  end
  
end