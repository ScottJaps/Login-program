require 'spec_helper'

describe IfoappController do
  
  describe "POST #create" do
   it "redirects to the home page upon creating a new entry" do
     post :create, volunteer: FactoryGirl.attributes_for(:volunteer)
     response.should redirect_to ifoapp_index_path
    end
  end
  
  describe "GET #index"do
    it "should render the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #sign_in"do
    it "should render the index view" do
      get :sign_in
      response.should render_template :sign_in
    end
  end


end
