# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :volunteer do |f|
    f.name "testname"
    f.phoneNumberEmail "123-456-7890"
    f.program "Other"
    f.time_in "2007-12-04 00:00:00"
    f.time_out "2007-12-04 10:00:00"
  end
  
  factory :invalid_volunteer, parent: :volunteer do |f|
    f.name nil
end


end
