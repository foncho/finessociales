# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :year do |f|
  f.year 2011
  f.budget 100000000.0
  f.social_percentage 60.0
  f.foreing_percentage 30.0
  f.environmental_percentage 10.0
  f.total_projects 100
  f.total_organizations 50
end
