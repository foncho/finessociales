# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :organization do |f|
  f.name "Hermanitas de la caridad"
  f.cif "0123456ABCD"
  f.budget 100000.0
end