class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_guest_user, only: [:edit]

  def mypage
    @user = current_user
    @posts = @user.posts
  end

  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])

    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])

    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

    if @user.update(user_params)
      flash[:success] = 'プロフィールの更新に成功しました。'
      redirect_to mypage_path
    else
      flash.now[:danger] = 'プロフィールの更新に失敗しました。'
      render :edit
    end
  end

  def confirm
  end

  def withdraw
  end


  # ストロングパラメータ
  private
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user)
      flash[:info] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
