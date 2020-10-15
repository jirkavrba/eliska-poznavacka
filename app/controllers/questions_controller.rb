class QuestionsController < ApplicationController
  before_action :load_question_set

  def index
    @questions = @question_set.questions
  end

  def new
    @question = Question.new
  end

  def create
    @question = @question_set.questions.build(params.require(:question).permit(:image_url, :answer))

    if @question.valid?
      @question.save
      redirect_to params.key?(:add_next) ? new_question_set_question_path : question_set_questions_path
    else
      flash[:errors] = @question.errors.full_messages
      redirect_to new_question_set_question_path
    end
  end

  def edit
    @question = @question_set.questions.find(params[:id])
  end

  def update
    @question = @question_set.questions.find(params[:id])

    if @question.valid?
      @question.update(params.require(:question).permit(:image_url, :answer))
      redirect_to question_set_questions_path
    else
      flash[:errors] = @question.errors.full_messages
      redirect_to edit_question_set_question_path(@question_set, @question)
    end
  end

  private

  def load_question_set
    @question_set = QuestionSet.find(params[:question_set_id])
  end
end