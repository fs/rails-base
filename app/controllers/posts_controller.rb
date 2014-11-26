class PostsController < ApplicationController
  respond_to :html

  expose(:post, attributes: :post_params)
  expose(:posts) { Post.page(params[:page]) }

  def create
    flash[:notice] = 'Post was successfully created.' if post.save
    respond_with(post)
  end

  def update
    flash[:notice] = 'Post was successfully updated.' if post.save
    respond_with(post)
  end

  def destroy
    post.destroy
    respond_with(post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :picture, :privacy)
  end
end
