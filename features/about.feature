Feature: About page
  In order to watch information
  As a citizen
  I want to visit the about page

  Scenario: About page
    When I am on the about page
    Then I should see "Sobre la aplicación"

  Scenario: Go to the about page
    Given a year exists
      And I am on the home page
      When I follow "Acerca de"
      Then I am on the about page
