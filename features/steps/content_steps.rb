# Scenario: Empty home page

Given /no pages/ do
  Pages.destroy_all
end

When /I go to the home page/ do
  visits "/"
end

# Future scenarios...

Given /a standard home page/ do
  Pages.create(:title => "Home", 
               :content => "Welcome\n===\nThis is the home page.")
end

Given /an? "(.*?)" child of "(.*?)"/ do |child, parent|
  @parent = Pages.find_by_title(parent) or raise ActiveRecord::RecordNotFound
  
  
end






  