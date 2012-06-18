class UserRatedAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  validates_presence_of :user_id, :answer_id
end
