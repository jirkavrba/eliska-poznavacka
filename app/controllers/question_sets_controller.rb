class QuestionSetsController < ApplicationController
  before_action :load_question_set, except: %i[index new create]

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
      redirect_to question_set_path(@question_set)
    else
      flash[:errors] = @question_set.errors.full_messages
      redirect_to edit_question_set_path(@question_set)
    end
  end

  def test; end

  def next_question
    render json: @question_set
      .questions
      .order(
        updated_at: :asc,
        correctly_answered_times: :desc,
        viewed_times: :asc,
        random_index: :desc
      )
      .first
  end

  def reset
    @question_set.questions.update({
                                     viewed_times: 0,
                                     correctly_answered_times: 0,
                                     last_viewed_at: DateTime.new
                                   })

    redirect_to question_set_questions_path(@question_set)
  end

  private

  def load_question_set
    @question_set = QuestionSet.find(params[:id])
  end
end
