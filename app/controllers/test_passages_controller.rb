# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show result update]

  def show
    set_timer_cookie
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.complete?
      TestsMailer.completed_test(@test_passage).deliver_now
      give_badges?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def set_timer_cookie
    cookies[:time_to_finish] = @test_passage.time_to_finish
  end

  def give_badges?
    badges = BadgeService.new(@test_passage).give_badge
    flash[:alert] = t('general.give_badge') if badges
  end
end
