class AnswersController < ApplicationController
  before_filter :authenticate_user!
  def create
    @answer = Answer.new(params[:answer])
    
    if @answer.save
      @count = Question.find(@answer.question_id).answers.count
      respond_to do|format|
        format.js
      end
    else
      @message = "Content " + @answer.errors[:content][0].to_s
      respond_to do|format|
        format.js{render "error" and return}
      end
    end

  end

  def show

  end

  def rating
    @answer = Answer.find(params[:id])
    valid = current_user.able_to_vote(@answer.id) # Checking if he eligible for vote 
        
    if !valid
      respond_to do|format|
        @message = "You have already vote for this answer"
        format.js{render "access" and return}
      end
    end

    if params[:vote].to_i == -1    
      current_user_rating_point = current_user.rating_point
      respond_to do|format|
        if current_user_rating_point >= 10
          #Any user can not decrease rating point of user , he should have at least rating point 10
          @answer.rating_point = @answer.rating_point - 1
          @answer.save
          user = User.find(@answer.user_id) 
          user.rating_point = user.rating_point - 1
          user.save
          @message = "Rating for given answer updated accordingly"
          UserRatedAnswer.create(:user_id => current_user.id, :answer_id => @answer.id)
          format.js
        else
          @message = "You does not have sufficient rating point "        
          format.js{render "access" and return }
        end
      end
    elsif params[:vote].to_i == 1
       @answer.rating_point = @answer.rating_point + 1
       @answer.save
       user = User.find(@answer.user_id) 
       user.rating_point = user.rating_point + 1
       user.save
       UserRatedAnswer.create(:user_id => current_user.id, :answer_id => @answer.id)
       @message = "Rating for given answer updated accordingly"
       respond_to do|format|
        format.js{ render and return}
       end
    end

  end

end
