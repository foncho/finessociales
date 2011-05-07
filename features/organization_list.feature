Feature: Organization List
  In order to watch all organizations
  As a citizen
  I want to visit the organization list page and see the most important details

  Scenario: List
    Given a organization exists with cif: "G-12345678", name: "Wadus Red Cross"
       When I go to the organizations page
       Then I should see "G-12345678"
        And I should see "Wadus Red Cross"
    
