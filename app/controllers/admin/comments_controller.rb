class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comments = Comment.page(params[:page])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.destroy
      flash.now[:success] = 'コメントを削除しました。'
    else
      flash.now[:danger] = 'コメントの削除に失敗しました。'
    end
  end
end
