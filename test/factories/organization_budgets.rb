# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :organization_budget do |f|
  f.year_id nil
  f.organization_id nil
  f.budget 10000
end