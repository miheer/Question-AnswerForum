class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates_presence_of :content, :user_id, :question_id
end
