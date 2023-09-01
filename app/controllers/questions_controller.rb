# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create index new]
  before_action :find_question, only: %i[edit destroy show update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def create
    @question = @test.questions.create(question_params)
    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  def new
    @question = Question.new
  end

  def destroy
    @question.destroy
    redirect_back(fallback_location: @question)
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
