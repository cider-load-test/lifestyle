require 'factory_girl'

# Valid items with usage
Factory.define :item_usage, :class => 'Item' do |i|
  i.usage 4
  i.association :report
end

# Valid items with impact
Factory.define :item_impact, :class => 'Item' do |i|
  i.impact 4
  i.association :report
end

# Valid reports
Factory.define :report do |r|
  r.day 4
  r.association :user
end

# Valid users
Factory.define :user do |u|
  u.login { |i| "user#{i}" }
  u.password "test"
  u.password_confirmation "test"
end