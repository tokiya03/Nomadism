class Public::UsersController < ApplicationController
  def mypage
    @user = current_user.id
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
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
