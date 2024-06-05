class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.save
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.new(post_params)
    post.update
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end


  # ストロングパラメータ
  private
  def post_parms
    params.require(:post).permit(:user_id, :name, :caption, :address, :latitude, :longitude)
  end
end
