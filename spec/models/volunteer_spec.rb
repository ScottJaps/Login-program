require 'spec_helper'

describe Volunteer do
  it "has a valid factory" do
    FactoryGirl.create(:volunteer).should be_valid
  end
  
  it "is invalid without a valid name" do
    FactoryGirl.build(:volunteer, name: nil).should_not be_valid
  end
  
  it "is invalid without a valid phone number" do
    FactoryGirl.build(:volunteer, phoneNumber: nil).should_not be_valid
  end
  
  it "will not require an email address" do
    FactoryGirl.build(:volunteer, email: "").should be_valid
    FactoryGirl.build(:volunteer, email: nil).should be_valid
  end
  
  it "will not take a bad email address" do
    FactoryGirl.build(:volunteer, email: "hello@gmailcom").should_not be_valid
  end
  
  it "is invalid without a program selected" do
    FactoryGirl.build(:volunteer, program: nil).should_not be_valid
  end
  
end