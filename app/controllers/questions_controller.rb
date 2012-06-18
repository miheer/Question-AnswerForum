class QuestionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @question = Question.new
    if !params[:question_id].blank?
      @recent_question = Question.find(params[:question_id])
      @answers = @recent_question.answers 
    else
      @recent_question = Question.order('updated_at desc' ).first
      @answers = @recent_question.try(:answers)
    end
    
    @related_questions = Question.select{|question| question.id != @recent_question.id}
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        @validation_messages = ""

        error_messages = @question.errors.collect do |attr, message|
            attr.to_s.humanize.concat(" ").concat(message)
        end
        
        error_messages.each do|message|
          @validation_messages << "<li>#{message} </li>"
        end
        format.js {render "error", :content_type => 'text/javascript', :layout => false}
      end
    end
  end
  
  def show
    @question = Question.find(params[:id])
    @answers  = @question.answers   
    @answer  = @question.answers.new
  end

end
