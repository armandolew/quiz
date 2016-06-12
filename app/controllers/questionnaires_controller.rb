class QuestionnairesController < ApplicationController

  def new
  	@questionnaire   = Questionnaire.new
  end

  def create
    @questionnaire   = Questionnaire.new(questionnaire_params)
    if @questionnaire.save
      flash.now[:success] = "Questionnaire saved!"
      redirect_to :show
    else
      flash.now[:danger] = "Questionnaire not saved"
      render 'new'
    end
  end

  def show
    @questionnaire   = Questionnaire.includes(:questions).find_by(:id => params[:id])
  end

  def index
    @questionnaires  = Questionnaire.all
  end

  def destroy
    @questionnaire   = Questionnaire.find_by(:id => params[:id])
    @questionnaire.destroy

    flash.now[:success] = "Questionnaire deleted!"
    redirect_to action: :index
  end


  private
    def questionnaire_params
    	params.require(:questionnaire).permit(:title, questions_attributes: [:id, :content, :answer, :_destroy])
    end	
end
