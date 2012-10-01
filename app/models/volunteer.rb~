class Volunteer < ActiveRecord::Base
  attr_accessible :name, :phoneNumber, :email, :program, :time_in, :time_out
  validates :name, :presence => true
  validates :phoneNumber, :presence => true
  validates :email, :format => {:with => /(^\s*$|^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(?:[a-zA-Z]+\z)$)/}, :allow_blank => true
  validates :program, :presence => true
  validates :time_in, :presence => true
end






# /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
