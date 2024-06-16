class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash.now[:success] = 'コメントを削除しました。'
    else
      flash.now[:danger] = 'コメントの削除に失敗しました。'
    end
  end
end
