require 'factory_girl'

Factory.define :user do |u|
  u.first_name 'Test' 
  u.last_name 'User'
  u.login 'testuser'
  u.email 'user@test.com'
  u.password 'please'
end

