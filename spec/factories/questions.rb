Factory.define :question do|quest|
  quest.title "Test question model"
  quest.content "How to rspec model test in rails 3.2.2"
  quest.user{ |user| user.association(:user)}
end
