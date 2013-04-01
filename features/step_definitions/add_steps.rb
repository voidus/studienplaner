Given %r{^I visit the (.*) page$} do |page|
  targets = {
    "home" => "/"
  }
  visit targets[page]
end

Given %r{^I fill in "(.*)" for "(.*)"$} do |value, field|
  fill_in(field, :with => value)
end

When %r{^I press "(.*)"$} do |name|
  click_button(name)
end

When %r{^I click on "(.*)"$} do |text|
  click_link(text)
end

Then %r{^I should see a link with "(.*)"$} do |text|
  page.should have_link(text)
end

Then %r{^I should see a button with "(.*)"$} do |label|
  page.should have_button(label)
end

Then %r{^I should see "(.*)"$} do |text|
  page.should contain(/#{text}/m)
end
