class FeedbacksController < ApplicationController
  expose :feedback

  before_action :setup_feedback, only: :new, if: :user_signed_in?

  def new
  end

  def create
    feedback.save
    respond_with(feedback, location: root_path)
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text)
  end

  def setup_feedback
    feedback.name = current_user.full_name
    feedback.email = current_user.email
  end
end
