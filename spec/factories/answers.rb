Factory.define :answer do|ans|
  ans.content "rspec can be include in Gemfile"
  ans.question {|question| question.association(:question)}
  ans.user {|user| user.association(:user)}
  ans.rating_point 0
end
