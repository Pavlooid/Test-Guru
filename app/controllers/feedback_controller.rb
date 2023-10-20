class FeedbackController < ApplicationController
  def create
    email = current_user.email
    FeedbackMailer.send_feedback(params[:body], email).deliver_now
    redirect_to root_path, notice: t('general.feedback_success')
  end

  def new; end
end
