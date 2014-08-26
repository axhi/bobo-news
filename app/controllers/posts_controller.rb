class PostsController < ApplicationController
  before_filter :login_check, only: [:new, :create]

  def index
    @posts = Post.where(user_id: params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @post.update(user: current_user)
      redirect_to post_comments_path(@post)
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url)
  end

end
