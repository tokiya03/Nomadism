class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_guest_user, only: [:new]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_parms)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = '投稿に成功しました。'
      redirect_to post_path(@post.id)
    else
      flash.now[:danger] = '投稿に失敗しました。'
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:info] = '投稿者以外は当投稿の編集画面に遷移できません。'
      redirect_to posts_path
    end
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(post_parms)
      flash[:success] = '投稿の更新に成功しました。'
      redirect_to post_path(@post.id)
    else
      flash.now[:danger] = '投稿の更新に失敗しました。'
      render :edit
    end

  end


  def destroy
    @post = Post.find(params[:id])
    if@post.user_id = current_user.id
      @post.destroy
      flash[:success] = '投稿の削除に成功しました。'
      redirect_to posts_path
    else
      flash[:danger] = '投稿の削除に失敗しました。'
      request.referer
    end
  end


  # ストロングパラメータ
  private
  def post_parms
    params.require(:post).permit(:name, :caption, :address)
  end

  def check_guest_user
    if current_user.email == 'guest@example.jp'
      flash[:info] = 'ゲストユーザーは投稿画面へ遷移できません。'
      redirect_to posts_path
    end
  end
end
