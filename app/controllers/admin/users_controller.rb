class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @groups = @user.groups
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報の更新に成功しました'
      redirect_to admin_user_path(@user.id)
    else
      flash.now[:danger] = 'ユーザー情報の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @group = @user.groups.where(owner_id: @user.id)
    if @group.destroy_all && @user.destroy
      flash[:info] = '退会処理が完了しました。'
      redirect_to admin_users_path
    else
      flash[:danger] = '退会処理に失敗しました。'
      render :edit
    end
  end

  # ストロングパラメータ
  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
end
