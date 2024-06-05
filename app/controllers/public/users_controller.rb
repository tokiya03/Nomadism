class Public::UsersController < ApplicationController
    before_action :authenticate_user!

  def mypage
    @user = current_user
  end

  def index
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.id = current_user.id
      user.update
      redirect_to :show
    else
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
end
