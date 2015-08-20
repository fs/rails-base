class FeedbacksController < ApplicationController
  expose(:feedback) { Feedback.new(feedback_attributes) }

  def new
  end

  def create
    ApplicationMailer.feedback(feedback).deliver_now! if feedback.save
    respond_with(feedback, location: root_path)
  end

  private

  def feedback_attributes
    params.fetch(:feedback, {}).permit(:email, :name, :message, :phone)
  end
end
