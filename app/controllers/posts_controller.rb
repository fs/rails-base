class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  expose(:post, attributes: :post_params)
  expose(:posts)

  def index
    respond_with posts
  end

  def show
    respond_with post
  end

  def new
    respond_with post
  end

  def edit
  end

  def create
    if post.save
      respond_with post
    else
      flash_message("create")
      render action: 'new'
    end
  end

  def update
    if post.update(post_params)
      respond_with post
    else
      flash_message("update")
      render action: 'edit'
    end
  end

  def destroy
    post.delete

    respond_with post
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :content
    )
  end

  def flash_message(method)
     flash.now[:error] = "Could not #{method} the client. "\
        "Please, check that the fields below filled out correctly."
  end
end
