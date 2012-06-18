class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  validates_presence_of :first_name
  
  has_many :questions
  has_many :answers
  has_many :user_rated_answers

  def able_to_vote(answer_id)
    self.user_rated_answers.where(:answer_id => answer_id).blank?
  end

  def full_name
    [first_name, last_name].join(' ')
  end
end
