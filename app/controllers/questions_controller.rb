# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index]
  bedore_action :find_question, only: %i[destroy]

  def index
    @questions = @test.questions
  end

  def start; end

  def create; end

  def new; end

  def destroy; end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
