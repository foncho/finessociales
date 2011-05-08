Feature: Homepage
  In order to find out what social projects are being supported with Spanish tax money
  As a citizen
  I want to visit the homepage and see the most important details

  Background:
    Given a year exists with year: 2010

  Scenario: Homepage
    Given a year exists with year: 2009
     When I go to the homepage
     Then show me the page
     Then I should see "100 millones de euros"
      And I should see "Proyectos sociales 2011"

  Scenario: Top 5 (Organizations and Projects)
    Given 10 organizations exists with projects in the year 2010
     When I go to the homepage
     Then I should see the organizations top 5
      And I should see the projects top 5
