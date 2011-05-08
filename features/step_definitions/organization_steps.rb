Given /^(\d+) organizations exists with projects in the year (\d+)$/ do |orgs_num, year|
  orgs_num.to_i.times { proj = Factory(:project, :organization => Factory(:organization), :year => Year.find_by_year(year)) }
end

Given /^the organization "([^"]*)" has following budget data:$/ do |org_name, table|
  org = Organization.find_by_name!(org_name)
  table.hashes.each do |row|
    if row['year'] == 'Total'
      org.update_attribute(:budget, row['budget'])
    else
      year = Year.find_by_year(row['year']) || Factory(:year, :year => row['year'])
      if org_budget = OrganizationBudget.find_by_year_id_and_organization_id(year.id, org.id)
        org_budget.update_attribute(:budget => row['budget'])
      else
        Factory(:organization_budget, :organization => org, :year => year, :budget => row['budget'])
      end
    end
  end

end

Then /^I should see the following organizations list$/ do |expected_list|
  expected_list.diff!(tableish('table.organizations tr', 'th,td'))
end