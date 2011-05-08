Feature: Organization Show
  In order to watch an organizations
  As a citizen
  I want to visit the organization page and see the most important details

  Scenario: Show
    Given an organization "org" exists with cif: "G-12345678", name: "Wadus Red Cross"
      And the organization "Wadus Red Cross" has following budget data:
         | year  | budget |
         | 2010  | 1000   |
         | 2011  | 2000   |
         | Total | 3000   |
      # And a year "year" exists with year: "2010"
      # And a organization budget "ob1" exists with year: year "year", organization: organization "org", budget: "500000"
      # And a group "group1" exists with name: "Refugiados"
      # And a group "group2" exists with name: "Desamparados"
      # And a group budget "gb1" exists with year: year "year", group: group "group1", budget: "40000", percentage: "50"
      # And a group budget "gb2" exists with year: year "year", group: group "group2", budget: "10000", percentage: "50"
      # And a target "target1" exists with name: "Programa para refugiados 1", group: group "group1"
      # And a target budget "tb1" exists with year: year "year", target: target "target1", budget: "20000"
      # And a target "target2" exists with name: "Programa para refugiados 2", group: group "group1"
      # And a target budget "tb2" exists with year: year "year", target: target "target2", budget: "10000"
      # And a target "target3" exists with name: "Programa para refugiados 3", group: group "group1"
      # And a target budget "tb3" exists with year: year "year", target: target "target3", budget: "10000"
      # And a target "target4" exists with name: "Programa para desemparados 1", group: group "group2"
      # And a target budget "tb4" exists with year: year "year", target: target "target4", budget: "10000"
      # And a project exists with year: year "year", organization: organization "org", title: "Proyecto 1", budget: "10000", target: target "target1"
      # And a project exists with year: year "year", organization: organization "org", title: "Proyecto 2", budget: "10000", target: target "target1"
      # And a project exists with year: year "year", organization: organization "org", title: "Proyecto 3", budget: "10000", target: target "target2"
      # And a project exists with year: year "year", organization: organization "org", title: "Proyecto 4", budget: "10000", target: target "target3"
      # And a project exists with year: year "year", organization: organization "org", title: "Proyecto 5", budget: "10000", target: target "target4"
     When I go to the organization page with cif "G-12345678"
     # Organization information
     Then I should see the following organizations list
         | CIF        | Entidad         | 2011       | 2010       | Total      |
         | G-12345678 | Wadus Red Cross | 2,000.00 € | 1,000.00 € | 3,000.00 € |

     # # First group
     #  And I should see "Refugiados"
     #  And I should see "40,000.00"
     # # First group targets and projects
     #  And I should see "Programa para refugiados 1"
     #  And I should see "20,000.00"
     #  And I should see "Proyecto 1"
     #  And I should see "10,000.00"
     #  And I should see "Proyecto 2"
     #  And I should see "10,000.00"
     #  And I should see "Programa para refugiados 2"
     #  And I should see "10,000.00"
     #  And I should see "Proyecto 3"
     #  And I should see "10,000.00"
     #  And I should see "Programa para refugiados 3"
     #  And I should see "10,000.00"
     #  And I should see "Proyecto 4"
     #  And I should see "10,000.00"
     # # Second group
     #  And I should see "Desamparados"
     #  And I should see "10,000.00"
     # # Second group targets and projects
     #  And I should see "Programa para desemparados 1"
     #  And I should see "10,000.00"
     #  And I should see "Proyecto 4"
     #  And I should see "10,000.00"

  Scenario: Go to the organization page
      Given a organization exists with name: "Cruz Roja Española", cif: "G-9999995"
        And I am on the organizations page
       When I follow "Cruz Roja Española"
       Then I should be on the organization page with cif "G-9999995"

  Scenario: Go to the organization page from the homepage (top5)
      Given a year "year" exists
        And a organization "org" exists with name: "Cruz Roja Española", cif: "G-9999995"
        And a organization budget exists with year: year "year", organization: organization "org", budget: "500000"
        And I am on the homepage
       When I follow "Cruz Roja Española"
       Then I should be on the organization page with cif "G-9999995"
