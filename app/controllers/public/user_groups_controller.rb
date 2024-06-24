class Public::UserGroupsController < ApplicationController
  before_action :authenticate_user!

  def create
    group_user = current_user.user_groups.new(group_id: params[:group_id])
    if group_user.save
      flash[:success] = 'グループへの参加に成功しました。'
    else
      flash[:danger] = 'グループへの参加に失敗しました。'
    end
    redirect_to request.referer
  end

  def destroy
    group_user = current_user.user_groups.find_by(group_id: params[:group_id])
    if group_user.destroy
      flash[:success] = 'グループからの脱退に成功しました。'
    else
      flash[:danger] = 'グループからの脱退に失敗しました。'
    end
    redirect_to request.referer
  end
end
