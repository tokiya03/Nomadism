class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_guest_user, only: [:new]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.users << current_user
    if @group.save
      flash[:success] = 'グループの作成に成功しました。'
      redirect_to group_path(@group.id)
    else
      flash.now[:danger] = 'グループの作成に失敗しました。'
      render :new
    end
  end

  def index
    @user = current_user
    @groups = Group.page(params[:page])
  end

  def show
    @user = current_user
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
    @users = @group.users.pluck(:name, :id)
    if @group.owner_id != current_user.id
      flash[:info] = 'グループオーナー以外は編集画面に遷移できません。'
      redirect_to group_path(@group.id)
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.owner_id != current_user.id
      flash[:info] = 'グループオーナー以外はグループ情報を更新できません。'
      redirect_to group_path(@group.id)
    else
      if @group.update(group_params)
        flash[:success] = 'グループの更新に成功しました。'
        redirect_to group_path(@group.id)
      else
        flash.now[:danger] = 'グループの更新に失敗しました。'
        render :edit
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.users.delete(current_user)
    if @group.destroy
      flash[:success] = 'グループの削除に成功しました。'
      redirect_to groups_path
    else
      flash[:danger] = 'グループの削除に失敗しました。'
      render :show
    end
  end

  # ストロングパラメータ
  private
  def group_params
    params.require(:group).permit(:name, :owner_id, :introduction, :group_image)
  end

  def check_guest_user
    if current_user.email == 'guest@example.jp'
      flash[:info] = 'ゲストユーザーはグループ作成画面へ遷移できません。'
      redirect_to groups_path
    end
  end
end
