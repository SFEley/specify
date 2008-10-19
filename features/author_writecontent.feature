Feature: Write Content
  As an author
  I want to write content
  So that I can get it out of my head.
  
  Scenario: Empty home page
    Given no pages
    When I go to the home page
    Then I should see "New Page"
    
  Scenario: Create home page
    Given no pages
    When I go to the home page
      And I fill in "Title" with "Home"
      And I fill in "Content" with "Welcome\n===\nThis is the home page."
      And I press "Publish"
    Then I should see "Welcome"
      And I should see "This is the home page."
      And I should not see a form tag
      
  Scenario: New child page
    Given a standard home page
    When I go to the home page
      And I press "Submit a Page"
    Then I should see "New Page"
      And I should "This is a child of page <a.*>Home</a>."
      And I should see a form tag

  Scenario: Create child page
    Given a standard home page
    When I go to the home page
      And I press "Submit a Page"
      And I fill in "Title" with "Additional"
      And I fill in "Content" with "More Stuff\n===\nI am entering some detailed information."
      And I press "Publish"
    Then I should see an H1 tag with "More Stuff"
      And I should see "some detailed information"
      And I should see an li tag with "Home"
      And I should see an li tag with "Additional"
      And I should not see a form tag
  
  Scenario: New child of child
    Given a standard home page
      And a "Secondary" child of "Home"
    When I go to the "Secondary" page
      And I press "Submit a Page"
    Then I should see "New Page"
      And I should "This is a child of page <a.*>Secondary</a>."
      And I should see a form tag
    
  Scenario: Create child of child
    Given a standard home page
      And a "Secondary" child of "Home"
    When I go to the "Secondary" page
      And I press "Submit a Page"
      And I fill in "Title" with "Tertiary"
      And I fill in "Content" with "Even More\n===\nThis is getting pretty detailed."
      And I press "Publish"
    Then I should see an H1 tag with "Even More"
      And I should see "getting pretty detailed"
      And I should see an li tag with "Home"
      And I should see an li tag with "Secondary"
      And i should see an li tag with "Tertiary"
      And I should not see a form tag
    