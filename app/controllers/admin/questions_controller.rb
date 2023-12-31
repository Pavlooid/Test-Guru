# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[edit destroy show update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question], notice: t('.success')
    else
      render :edit
    end
  end

  def create
    @question = @test.questions.create(question_params)
    if @question.save
      redirect_to [:admin, @question], notice: t('.success')
    else
      render :new
    end
  end

  def new
    @question = Question.new
  end

  def destroy
    @question.destroy
    redirect_to [:admin, @question.test], notice: t('.success')
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
