class CommentsController < ApplicationController
  before_filter :authenticate_user!

  expose(:post)
  expose(:comments, ancestor: :post)
  expose(:comment, attributes: :comment_params)

  def create
    if comment.save
      redirect_to post
    else
      redirect_to post,
        alert: "Could not create the comment. "\
        "Please, check that the fields below filled out correctly."
    end
  end

  def destroy
    comment.delete

    redirect_to post
  end

  private

  def comment_params
    params.require(:comment).permit(
      :title,
      :text
      )
  end
end
