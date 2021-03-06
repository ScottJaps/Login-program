When /^(?:|I ) click "([^"]*)"$/ do |link|
  click_link(link)
end


When /^I fill in the fields on the sign in page$/ do
  fill_in("volunteer_name", :with => "testname")
  fill_in("volunteer_phoneNumberEmail", :with => "123-456-7890")
  select("Other", :from => "volunteer_program")
  select("05 PM", :from => "volunteer_time_in_4i")
  select("00", :from => "volunteer_time_in_5i")
end

When /^I fill in the sign in password and submit$/ do
  fill_in("password", :with => "Vol2013")
  click_button("Staff_Sign_In")
end

When /^I fill in the sign in password wrong and submit$/ do
  fill_in("password", :with => "wrong_pass")
  click_button("Staff_Sign_In")
end


Then /^I should see a sign in confirmation$/ do
  assert page.has_content?("Sign in successful")
end

Then /^I should see a sign out confirmation$/ do
  assert page.has_content?("Sign out successful")
end

Given /volunteers exist/ do 
   Volunteer.create({"name"=>"test1", "phoneNumberEmail"=>"phone123", "program"=>"Food Shelf", "time_in(1i)"=>"2012", "time_in(2i)"=>"10", "time_in(3i)"=>"11", "time_in(4i)"=>"18", "time_in(5i)"=>"15"}) 
   Volunteer.create({"name"=>"test2", "phoneNumberEmail"=>"phoneaaa", "program"=>"Other", "time_in(1i)"=>"2012", "time_in(2i)"=>"10", "time_in(3i)"=>"10", "time_in(4i)"=>"18", "time_in(5i)"=>"15"})
   Volunteer.create({"name"=>"testbb", "phoneNumberEmail"=>"phonebbb", "program"=>"Food Shelf", "time_in(1i)"=>"2012", "time_in(2i)"=>"10", "time_in(3i)"=>"9", "time_in(4i)"=>"18", "time_in(5i)"=>"15"})
   Volunteer.create({"name"=>"testaa", "phoneNumberEmail"=>"phoneccc", "program"=>"Other", "time_in(1i)"=>"2012", "time_in(2i)"=>"10", "time_in(3i)"=>"8", "time_in(4i)"=>"18", "time_in(5i)"=>"15"})  
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
   assert page.body.index(e1)<page.body.index(e2)
end
