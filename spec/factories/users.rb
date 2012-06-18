Factory.sequence :email do|n|
  "user#{n}@test.com"
end

Factory.define :user do|u|
  u.email { Factory.next(:email) }
  u.first_name "first name"
  u.last_name "user"
  u.password "test123"
end
