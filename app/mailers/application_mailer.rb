class ApplicationMailer < ActionMailer::Base
  def feedback(feedback)
    @feedback = feedback
    mail(subject: "Feedback", from: feedback.email, to: app_config.feedback_email)
  end
end
