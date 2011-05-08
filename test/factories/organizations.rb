# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :organization do |f|
  f.name { SecureRandom.hex(10) }
  f.cif  { ((rand * 10e7).truncate.to_s.ljust(8, '0') + ("A".."Z").to_a[rand(("A".."Z").to_a.size)]) }
end
