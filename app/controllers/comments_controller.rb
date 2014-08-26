class CommentsController < ApplicationController
  before_filter :login_check, only: [:create]

  def index
    if params[:user_id]
      user_comments
    else
      post_comments
    end
  end

  def post_comments
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: params[:post_id])
    render 'index'
  end

  def user_comments
    @comments = Comment.where(commenter_id: params[:user_id])
    render 'show'
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.update(commenter: current_user, post_id: params[:post_id])
    redirect_to
  end

  private

  def comment_params
    params.require(:comment).permit(:body_text)
  end
end
