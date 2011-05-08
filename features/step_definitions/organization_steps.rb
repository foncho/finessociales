Given /^(\d+) organizations exists with projects in the year (\d+)$/ do |orgs_num, year|
  orgs_num.to_i.times { proj = Factory(:project, :organization => Factory(:organization), :year => Year.find_by_year(year)) }
end 
