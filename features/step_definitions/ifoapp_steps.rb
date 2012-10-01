When /^(?:|I ) click "([^"]*)"$/ do |link|
  click_link(link)
end


When /^I fill in the fields on the sign in page$/ do
  fill_in("volunteer_name", :with => "testname")
  fill_in("volunteer_phoneNumber", :with => "123-456-7890")
  fill_in("volunteer_email", :with => "testemail@test.com")
  select("Other", :from => "volunteer_program")
  select("05 PM", :from => "volunteer_time_in_4i")
  select("00", :from => "volunteer_time_in_5i")
end

Then /^I should see a sign in confirmation$/ do
  assert page.has_content?("was Successfully Signed In")
end

