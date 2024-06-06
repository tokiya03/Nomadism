class Public::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_guest_user, only: [:edit]

  def mypage
    @user = current_user
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:info] = '他のユーザーのプロフィール編集画面には遷移できません。'
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.update(user_params)
      flash[:success] = 'プロフィールの更新に成功しました。'
      redirect_to mypage_path
    else
      flash.now[:danger] = 'プロフィールの更新に失敗しました。'
      render :edit
    end
  end

  # 論理削除する時の記述
  # def confirm
  # end
  #
  # def withdraw
  # end

  # 物理削除する時の記述
  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.destroy
      flash[:info] = '退会処理が完了しました。'
      redirect_to new_user_registration_path
    else
      flash[:danger] = '退会処理に失敗しました。'
      render :edit
    end
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
