# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create index new update]
  before_action :find_question, only: %i[destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = @test.questions.create(question_params)
    render plain: @question.inspect
  end

  def destroy
    @question.destroy
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :question)
  end

  def rescue_with_question_not_found
    render plain: "Вопрос с id=#{params[:id]} не найден!"
  end
end