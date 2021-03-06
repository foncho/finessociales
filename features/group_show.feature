Feature: Group Show
  In order to watch a group
  As a citizen
  I want to visit the group page and see the most important details

  Scenario: Show
    Given an organization "org" exists with cif: "G-12345678", name: "Wadus Red Cross"
      And a year "year" exists with year: "2000"
      And a organization budget "ob1" exists with year: year "year", organization: organization "org", budget: "500000"
      And a group "group1" exists with name: "Refugiados"
      And a group "group2" exists with name: "Desamparados"
      And a group budget "gb1" exists with year: year "year", group: group "group1", budget: "40000", percentage: "50"
      And a group budget "gb2" exists with year: year "year", group: group "group2", budget: "10000", percentage: "50"
      And a target "target1" exists with name: "Programa para refugiados 1", group: group "group1"
      And a target budget "tb1" exists with year: year "year", target: target "target1", budget: "20000"
      And a target "target2" exists with name: "Programa para refugiados 2", group: group "group1"
      And a target budget "tb2" exists with year: year "year", target: target "target2", budget: "10000"
      And a target "target3" exists with name: "Programa para refugiados 3", group: group "group1"
      And a target budget "tb3" exists with year: year "year", target: target "target3", budget: "10000"
      And a target "target4" exists with name: "Programa para desemparados 1", group: group "group2"
      And a target budget "tb4" exists with year: year "year", target: target "target4", budget: "10000"
      And a project exists with year: year "year", organization: organization "org", title: "Proyecto 1", budget: "10000", target: target "target1"
      And a project exists with year: year "year", organization: organization "org", title: "Proyecto 2", budget: "10000", target: target "target1"
      And a project exists with year: year "year", organization: organization "org", title: "Proyecto 3", budget: "10000", target: target "target2"
      And a project exists with year: year "year", organization: organization "org", title: "Proyecto 4", budget: "10000", target: target "target3"
      And a project exists with year: year "year", organization: organization "org", title: "Proyecto 5", budget: "10000", target: target "target4"
     When I go to the group page with name "Refugiados"
     # Organization information
     Then I should see "Refugiados"
      And I should see "40.000,00"
     # First group targets and projects
      And I should see "Programa para refugiados 1"
      And I should see "20.000,00"
      And I should see "Proyecto 1"
      And I should see "10.000,00"
      And I should see "Proyecto 2"
      And I should see "10.000,00"
      And I should see "Programa para refugiados 2"
      And I should see "10.000,00"
      And I should see "Proyecto 3"
      And I should see "10.000,00"
      And I should see "Programa para refugiados 3"
      And I should see "10.000,00"
      And I should see "Proyecto 4"
      And I should see "10.000,00"

  Scenario: Go to the group page
      Given a group exists with name: "Juventud"
        And I am on the groups page
       When I follow "Juventud"
       Then I should be on the group page with name "Juventud"

