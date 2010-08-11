@series
Feature: Edit Series

  Scenario: Three ways to add a work to a series
    Given the following activated user exists
      | login         | password   |
      | author        | password   |
      And a warning exists with name: "Choose Not To Use Archive Warnings", canonical: true
    When I am logged in as "author" with password "password"
      And I go to the new work page
      And I select "Not Rated" from "Rating"
      And I check "Choose Not To Use Archive Warnings"
      And I fill in "Fandoms" with "My Little Pony"
      And I check "series-options-show"
      And I fill in "work_series_attributes_title" with "Ponies"
      And I fill in "Work Title" with "Sweetie Belle"
      And I fill in "content" with "First little pony is all alone"
      And I press "Preview"
    Then I should see "Part 1 of the Ponies series"
      And I should see "Draft was successfully created"
    When I press "Post"
    Then I should see "Work was successfully posted"
      And I should see "Part 1 of the Ponies series" within "p"
      And I should see "Part 1 of the Ponies series" within "dd"
    When I view the series "Ponies"
    Then I should see "Sweetie Belle"
    When I go to the new work page
      And I select "Not Rated" from "Rating"
      And I check "Choose Not To Use Archive Warnings"
      And I fill in "Fandoms" with "My Little Pony"
      And I select "Ponies" from "work_series_attributes_id"
      And I fill in "Work Title" with "Starsong"
      And I fill in "content" with "Second little pony want to make friends"
      And I press "Preview"
    Then I should see "Part 2 of the Ponies series"
    When I press "Post"
      And I view the series "Ponies"
    Then I should see "Sweetie Belle"
      And I should see "Starsong"
    When I go to the new work page
      And I select "Not Rated" from "Rating"
      And I check "Choose Not To Use Archive Warnings"
      And I fill in "Fandoms" with "My Little Pony"
      And I fill in "Work Title" with "Rainbow Dash"
      And I fill in "content" with "Third little pony is a little shy"
      And I press "Preview"
      And I press "Post"
    When I view the series "Ponies"
    Then I should not see "Rainbow Dash"
    When I edit the work "Rainbow Dash"
      And I select "Ponies" from "work_series_attributes_id"
      And I press "Preview"
      And I press "Update"
      And I view the series "Ponies"
      And I follow "Rainbow Dash"
    Then I should see "Part 3 of the Ponies series"
    When I follow "«"
    Then I should see "Starsong"
    When I follow "«"
    Then I should see "Sweetie Belle"
    When I follow "»"
    Then I should see "Starsong"
    When I view the series "Ponies"
      And I follow "Edit"
      And I fill in "Series Title" with "Many a Pony"
      And I fill in "Series Description" with "This is a seriea about ponies. Of course"
      And I fill in "Series Notes" with "I wrote this under the influence of coffee! And pink chocolate."
      And I press "Update"
    Then I should see "Series was successfully updated."
      And I should see "This is a seriea about ponies. Of course" within "blockquote.user-generated-view"
      And I should see "I wrote this under the influence of coffee! And pink chocolate." within "blockquote.user-generated-view"
      And I should see "Complete: No"
    When I follow "Edit"
      And I check "series_complete"
      And I press "Update"
    Then I should see "Complete: Yes"
    When I edit the work "Rainbow Dash"
    Then the "series-options-show" checkbox should be checked
      And I should see "Many a Pony" within ".navigation"
    When I fill in "work_series_attributes_title" with "Black Beauty"
      And I press "Preview"
    Then I should see "Part 3 of the Many a Pony series" within "dd.series"
      And I should see "Part 1 of the Black Beauty series" within "dd.series"
    When I press "Update"
    Then I should see "Part 1 of the Black Beauty series" within "dd.series"
      And I should see "Part 3 of the Many a Pony series" within "dd.series"
      And I should see "Part 1 of the Black Beauty series" within "p.series"
      And I should see "Part 3 of the Many a Pony series" within "p.series"
    
  Scenario: Three ways to add a work to a series: a user with more than one pseud
    Given the following activated user exists
      | login         | password   |
      | author        | password   |
      And a warning exists with name: "Choose Not To Use Archive Warnings", canonical: true
    When I am logged in as "author" with password "password"
      And "author" creates the default pseud "Pointless Pseud"
      And I go to the new work page
      And I select "Not Rated" from "Rating"
      And I check "Choose Not To Use Archive Warnings"
      And I fill in "Fandoms" with "My Little Pony"
      And I select "Pointless Pseud" from "work_author_attributes_ids_"
      And I check "series-options-show"
      And I fill in "work_series_attributes_title" with "Ponies"
      And I fill in "Work Title" with "Sweetie Belle"
      And I fill in "content" with "First little pony is all alone"
      And I press "Preview"
    Then I should see "Part 1 of the Ponies series"
      And I should see "Draft was successfully created"
    When I press "Post"
    Then I should see "Work was successfully posted"
      And I should see "Pointless Pseud"
      And I should see "Part 1 of the Ponies series" within "p"
      And I should see "Part 1 of the Ponies series" within "dd"
    When I view the series "Ponies"
    Then I should see "Sweetie Belle"
    When I go to the new work page
      And I select "Not Rated" from "Rating"
      And I check "Choose Not To Use Archive Warnings"
      And I fill in "Fandoms" with "My Little Pony"
      And I select "Ponies" from "work_series_attributes_id"
      And I fill in "Work Title" with "Starsong"
      And I fill in "content" with "Second little pony want to make friends"
      And I press "Preview"
    Then I should see "Part 2 of the Ponies series"
    When I press "Post"
      And I view the series "Ponies"
    Then I should see "Sweetie Belle"
      And I should see "Starsong"
    When I go to the new work page
      And I select "Not Rated" from "Rating"
      And I check "Choose Not To Use Archive Warnings"
      And I fill in "Fandoms" with "My Little Pony"
      And I fill in "Work Title" with "Rainbow Dash"
      And I fill in "content" with "Third little pony is a little shy"
      And I press "Preview"
      And I press "Post"
    When I view the series "Ponies"
    Then I should not see "Rainbow Dash"
    When I edit the work "Rainbow Dash"
      And I select "Ponies" from "work_series_attributes_id"
      And I press "Preview"
      And I press "Update"
      And I view the series "Ponies"
      And I follow "Rainbow Dash"
    Then I should see "Part 3 of the Ponies series"
    When I follow "«"
    Then I should see "Starsong"
    When I follow "«"
    Then I should see "Sweetie Belle"
    When I follow "»"
    Then I should see "Starsong"
    When I view the series "Ponies"
      And I follow "Edit"
      And I fill in "Series Title" with "Many a Pony"
      And I fill in "Series Description" with "This is a seriea about ponies. Of course"
      And I fill in "Series Notes" with "I wrote this under the influence of coffee! And pink chocolate."
      And I press "Update"
    Then I should see "Series was successfully updated."
      And I should see "This is a seriea about ponies. Of course" within "blockquote.user-generated-view"
      And I should see "I wrote this under the influence of coffee! And pink chocolate." within "blockquote.user-generated-view"
      And I should see "Complete: No"
    When I follow "Edit"
      And I check "series_complete"
      And I press "Update"
    Then I should see "Complete: Yes"
    When I edit the work "Rainbow Dash"
    Then the "series-options-show" checkbox should be checked
      And I should see "Many a Pony" within ".navigation"
    When I fill in "work_series_attributes_title" with "Black Beauty"
      And I press "Preview"
    Then I should see "Part 3 of the Many a Pony series" within "dd.series"
      And I should see "Part 1 of the Black Beauty series" within "dd.series"
    When I press "Update"
    Then I should see "Part 1 of the Black Beauty series" within "dd.series"
      And I should see "Part 3 of the Many a Pony series" within "dd.series"
      And I should see "Part 1 of the Black Beauty series" within "p.series"
      And I should see "Part 3 of the Many a Pony series" within "p.series"
      