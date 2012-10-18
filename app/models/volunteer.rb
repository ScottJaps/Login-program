class Volunteer < ActiveRecord::Base
  attr_accessible :name, :phoneNumberEmail, :program, :time_in, :time_out, :description
  validates :name, :presence => { :message => "A Name is required" }
  validates :phoneNumberEmail, :presence => { :message => "A phone number or Email is required" }
  validates :program, :presence => true
  validates :time_in, :presence => true
end
