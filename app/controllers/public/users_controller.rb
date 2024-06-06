class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_guest_user, only: [:edit]

  def mypage
    @user = current_user
  end

  def index
    @users = User.all
    @posts = Posts.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

    if user.update(user_params)
      redirect_to mypage_path
      flash[:success] = 'プロフィールを更新しました。'
    else
      render :edit
      flssh.now[:danger] = 'プロフィールの更新に失敗しました。'
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
      flssh[:warning] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
