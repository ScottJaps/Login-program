require 'spec_helper'

describe Volunteer do
  it "has a valid factory" do
    FactoryGirl.create(:volunteer).should be_valid
  end
  
  it "is invalid without a valid name" do
    FactoryGirl.build(:volunteer, name: nil).should_not be_valid
  end
  
  it "is invalid without a valid phone number or email" do
    FactoryGirl.build(:volunteer, phoneNumberEmail: nil).should_not be_valid
  end
  
  
  it "is invalid without a program selected" do
    FactoryGirl.build(:volunteer, program: nil).should_not be_valid
  end
  
  
end
