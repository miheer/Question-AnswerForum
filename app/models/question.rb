class Question < ActiveRecord::Base
  belongs_to :user 
  has_many :answers

  accepts_nested_attributes_for :answers
  validates_presence_of :title, :content, :user_id  
end
