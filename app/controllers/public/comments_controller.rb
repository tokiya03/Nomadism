class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_guest_user, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  # ストロングパラメータ
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

  def check_guest_user
    post = Post.find(params[:post_id])
    if current_user.email == 'guest@example.jp'
      flash[:info] = 'ゲストユーザーはコメントできません。'
      redirect_to post_path(post.id)
    end
  end
end
