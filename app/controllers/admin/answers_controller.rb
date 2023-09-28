# frozen_string_literal: true

class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %i[create new]
  before_action :find_answer, only: %i[edit destroy show update]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to [:admin, @answer], notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to [:admin, @answer], notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to [:admin, @answer.question], notice: t('.success')
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
