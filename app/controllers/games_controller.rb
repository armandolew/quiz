class GamesController < ApplicationController
  def new
  	@id = params[:questionnaire_id]
  end

  def create
  	username  = params[:username]
  	questionnaire = Questionnaire.find_by(:id => params[:questionnaire_id])

    salt      = SecureRandom.hex(5)
    session[:username] = username.to_s + salt
    session[:score]    = 0

    redirect_to game_playing_path(:questionnaire_id => questionnaire.id, :question_id => 1) unless questionnaire.nil?
  end

  def show
    @questionnaire = Questionnaire.find_by(:id => params[:questionnaire_id])
    if !@questionnaire.nil?
      @question_number = params[:question_id].to_i
      @question = @questionnaire.questions[@question_number - 1]
      @question_count = @questionnaire.questions.count
    end
  end

  def results
    @score = session[:score]
    session.delete(:username)
    session.delete(:score)
  end

  def index
    @questionnaires = Questionnaire.all
  end

  def get_answer
    questionnaire_id = params[:questionnaire_id]
    question_id      = params[:question_id]
    answer_value     = params[:answer]

    @result          = false

    questionnaire    = Questionnaire.find_by(:id => questionnaire_id)
    question         = Question.where("id =? and questionnaire_id =?", question_id, questionnaire.id).first

    if !questionnaire.nil? and !question.nil?
      if AnswerMethods.set_answer(answer_value) == question.answer.to_i
        @result      = true
        session[:score] = session[:score].to_i + 1
      end
    end    

    respond_to do |format|  
      format.json{ render 'layouts/questionnaires/get_answer', status: :ok }
    end
  end

end
