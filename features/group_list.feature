Feature: Groups list
  In order to watch all groups
  As a citizen
  I want to visit the groups list page and see the most important details

  Background:
    Given a year exists with year: 2010

  Scenario: List
      Given a group exists with name: "Juventud"
       When I go to the groups page
       Then I should see "Juventud"

  Scenario: Go to the groups page
     Given I am on the homepage
      When I follow "Ir a colectivos"
      Then I should be on the groups page
