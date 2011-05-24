Feature: Organization List
  In order to watch all organizations
  As a citizen
  I want to visit the organization list page and see the most important details

  Scenario: List
    Given a organization exists with cif: "G-12345678", name: "Wadus Red Cross"
        And the organization "Wadus Red Cross" has following budget data:
           | year  | budget |
           | 2010  | 1000   |
           | 2011  | 2000   |
           | Total | 3000   |
       When I go to the organizations page
       Then I should see "G-12345678"
        And I should see the following organizations list
           | CIF        | Entidad         | 2012       | 2011       | Total      |
           | G-12345678 | Wadus Red Cross | 2.000,00 € | 1.000,00 € | 3.000,00 € |

  Scenario: Go to the organizations page
      Given a year exists
        And I am on the homepage
       When I follow "Ir a entidades"
       Then I should be on the organizations page

  Scenario: Go to the organizations page (header link)
      Given a year exists
       And I am on the homepage
      When I follow "Organizaciones"
      Then I should be on the organizations page
