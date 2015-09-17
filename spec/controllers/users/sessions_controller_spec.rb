require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it "should get home page aka sign_in" do
    get 'new'
    expect(response).to be_success
  end

  it 'sign in and redirect' do
    user = FactoryGirl.create(:user)

    credentials = attributes_for(:user)
    credentials.delete(:password_confirmation)
    
    post :create, user: credentials
    expect(response).to redirect_to(films_path)
  end
  
end