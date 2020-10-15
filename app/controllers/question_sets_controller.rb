class QuestionSetsController < ApplicationController
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

  def show
    @question_set = QuestionSet.find(params[:id])
  end

  def edit
    @question_set = QuestionSet.find(params[:id])
  end

  def update
    @question_set = QuestionSet.find(params[:id])
    @question_set.update(params.require(:question_set).permit(:name))

    if @question_set.valid?
      redirect_to question_set_path(@question_set.id)
    else
      flash[:errors] = @question_set.errors.full_messages
      redirect_to edit_question_set_path(@question_set.id)
    end
  end

  def test
    @question_set = QuestionSet.find(params[:id])
  end

  def reset
    @question_set = QuestionSet.find(params[:id])
    @question_set.questions.update({
       viewed_times: 0,
       correctly_answered_times: 0,
       incorrectly_answered_times: 0
     })

    redirect_to question_set_path(@question_set.id)
  end
end
