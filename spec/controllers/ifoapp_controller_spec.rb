require 'spec_helper'

describe IfoappController do
  
  describe "POST #create" do
    context "with valid attributes" do
     it "creates a new volunteer"do
      expect{
        post :create, volunteer: FactoryGirl.attributes_for(:volunteer)
      }.to change(Volunteer,:count).by(1)
     end
     it "redirects to the home page upon creating a new entry" do
       post :create, volunteer: FactoryGirl.attributes_for(:volunteer)
       response.should redirect_to ifoapp_index_path
     end
    end
    context "with invalid attributes"do
      it "will not save an invalid contact"do
        expect{
        post :create, contact: FactoryGirl.attributes_for(:invalid_volunteer)
      }.to_not change(Volunteer,:count)
      end
      it "redirects to the home page"do
       post :create, volunteer: FactoryGirl.attributes_for(:invalid_volunteer)
       response.should redirect_to ifoapp_index_path
      end
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
  
  
  describe "GET #viewall" do
    it "should render the view all view" do
      get :viewall
      response.should render_template :viewall
    end
  end


end
