require 'rails_helper'
include ActionDispatch::TestProcess

RSpec.describe FilmsController, type: :controller do

  context 'logged in' do

    login_user

    it "should get index" do
      get 'index'
      expect(response).to be_success
    end

    it "should get new" do
      get 'new'
      expect(response).to be_success
    end

    it 'should create and redirect' do
      @file = fixture_file_upload Rails.root.to_s + '/spec/factories/sample.jpg', 'image/jpeg'
  	  post :create, film: {title: "Test", galleries_attributes: { "0": { snapshot: @file } } }    
      expect(response).to redirect_to(films_path)
      expect(flash[:notice]).to eql("Film was successfully created.")
    end

    it "should get show" do
      user = User.find_by_email(attributes_for(:user)[:email])
      # user is the one who is logged in and prevent double creation 
      film = create(:film, user: user)
      get 'show', id: film
      expect(response).to be_success
    end

    it "should destroy" do
      user = User.find_by_email(attributes_for(:user)[:email])
      # user is the one who is logged in and prevent double creation 
      film = create(:film, user: user)
      delete 'destroy', id: film
      expect(response).to redirect_to(films_path)
      expect(flash[:notice]).to eql("Film was successfully deleted.")
    end

    it "should not destroy film of someone else" do
      another_user = create(:another_user)
      film = create(:film, user: another_user)
      
      expect{
        delete 'destroy', id: film
        expect(response).to redirect_to(films_path)
        expect(flash[:alert]).to eql("Film not belong to you.")
      }.to_not change{Film.count}
    end

    it "should update" do
      user = User.find_by_email(attributes_for(:user)[:email])
      # user is the one who is logged in and prevent double creation 
      film = create(:film, user: user, title: 'New title')
      patch 'update', id: film.id, film: film.attributes
      expect(response).to redirect_to(films_path)
      expect(flash[:notice]).to eql("Film was successfully updated.")
      expect(assigns(:film).title).to eql("New title")
    end

    it "should not update film of someone else" do
      another_user = create(:another_user)
      film = create(:film, user: another_user)
      film = create(:film, user: another_user, title: 'New title')
      patch 'update', id: film.id, film: film.attributes
      expect(response).to redirect_to(films_path)
      expect(flash[:alert]).to eql("Film not belong to you.")
    end

    it "should not update with no title" do
      user = User.find_by_email(attributes_for(:user)[:email])
      # user is the one who is logged in and prevent double creation 
      film = create(:film, user: user)
      film[:title] = nil
      patch 'update', id: film.id, film: film.attributes
      expect(response).to render_template(:edit)
      expect(assigns(:film)).not_to be_valid
    end



  end


  context 'not logged in' do

    logout_user

    it "should not get index" do
      get 'index'
      expect(response).to redirect_to(new_user_session_path)
      expect(flash[:alert]).to eql("You need to sign in or sign up before continuing.")
    end

  end


end