require 'factory_girl'

Factory.define :item do |i|
  i.usage 4
  i.association :report
  i.association :metric
end

Factory.define :report do |r|
  r.day 4
  r.association :user
end

Factory.define :user do |u|
  u.login { Factory.next(:login) }
  u.password "test"
  u.password_confirmation "test"
end

Factory.define :metric do |m|
  m.name { Factory.next(:name) }
  m.usage_unit "minutes"
  m.impact_unit "gallons"
  m.ratio 3 # 3 gallons/minute
  m.association :user
end

# Bigifies and randomizes input
def n(i); (i*10 + ((rand(5) + rand) * 1000).to_i).to_s; end

Factory.sequence :login do |i| "user" + n(i) end
Factory.sequence :name do |i| "shower" + n(i) end