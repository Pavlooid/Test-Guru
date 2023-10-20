class FeedbackMailer < ApplicationMailer
  def send_feedback(body, email)
    @email = email
    @body = body
    
    mail to: 'pavlooo987@gmail.com'
  end
end
