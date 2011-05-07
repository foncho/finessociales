# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :group_budget do |f|
  f.year_id nil
  f.group_id nil
  f.budget 10000
  f.percentage 25.0
end