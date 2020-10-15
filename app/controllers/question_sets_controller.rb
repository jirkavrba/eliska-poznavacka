class QuestionSetsController < ApplicationController
  before_action :load_question_set, except: [:index, :new, :create]

  def index
    @question_sets = QuestionSet.all
  end

  def new
    @question_set = QuestionSet.new
  end

  def create
    @question_set = QuestionSet.create(params.require(:question_set).permit(:name))

    if @question_set.valid?
      redirect_to question_sets_path
    else
      flash[:errors] = @question_set.errors.full_messages
      redirect_to new_question_set_path
    end
  end

  def show; end

  def edit; end

  def update
    @question_set.update(params.require(:question_set).permit(:name))

    if @question_set.valid?
      redirect_to question_set_path(@question_set.id)
    else
      flash[:errors] = @question_set.errors.full_messages
      redirect_to edit_question_set_path(@question_set.id)
    end
  end

  def test; end

  def next_question
    render json: @question_set.questions.order(
      incorrectly_answered_times: :asc,
      correctly_answered_times: :desc,
      updated_at: :desc
    ).first
  end

  def reset
    @question_set.questions.update({
       viewed_times: 0,
       correctly_answered_times: 0,
       incorrectly_answered_times: 0
     })

    redirect_to question_set_path(@question_set.id)
  end

  private 

  def load_question_set
    @question_set = QuestionSet.find(params[:id])
  end
end
