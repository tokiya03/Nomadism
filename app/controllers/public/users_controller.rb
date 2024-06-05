class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_current_user

  def mypage
    @self = @user
    # 自身が投稿したものに対するコメント
    # @comments = @user.posts.comments
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update
  end

  def confirm
  end

  def withdraw
  end


  # ストロングパラメータ
  private
  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
