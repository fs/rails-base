class CommentsController < ApplicationController
  before_filter :authenticate_user!

  expose(:post)
  expose(:comments, ancestor: :post)
  expose(:comment, attributes: :comment_params)

  def create
    comment.save

    redirect_to post
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
