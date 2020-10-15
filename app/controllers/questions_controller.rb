class QuestionsController < ApplicationController
  before_action :load_question_set

  def index
    render json: { its: :working }
  end

  private

  def load_question_set
    @question_set = QuestionSet.find(params[:question_set_id])
  end
end
