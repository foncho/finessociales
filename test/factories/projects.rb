# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :project do |f|
  f.year_id nil
  f.organization_id nil
  f.target_id nil
  f.title "Proyecto para alimentar a todos"
  f.budget 100000.5
end
