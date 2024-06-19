class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all.order(id: 'desc')
    respond_to do |format|
      format.html
      format.json { render json: @posts.with_user_name }
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts_json = Post.where(id: @post.id).with_user_name
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = '投稿の削除に成功しました。'
      redirect_to admin_posts_path
    else
      flash.now[:danger] = '投稿の削除に失敗しました。'
      request.referrer
    end
  end
end
