# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[destroy edit show start update]

  def create
    @test = current_user.created_tests.build(test_params)
    if @test.save
      redirect_to [:admin, @test]
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_back(fallback_location: @tests)
  end

  def edit; end

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def show; end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
