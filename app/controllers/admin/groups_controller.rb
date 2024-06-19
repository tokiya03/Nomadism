class Admin::GroupsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @groups = Group.page(params[:page])
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      flash[:success] = 'グループの削除に成功しました。'
      redirect_to admin_groups_path
    else
      flash[:danger] = 'グループの削除に失敗しました。'
      redirect_to admin_group_path(@group.id)
    end
  end
end
