require 'rails_helper'

RSpec.describe FilmsController, type: :controller do

  login_user

  it "should get index" do
    get 'index'
    expect(response).to be_success
  end

  it "should get new" do
    get 'new'
    expect(response).to be_success
  end

end