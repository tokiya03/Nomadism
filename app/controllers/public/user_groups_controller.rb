class Public::UserGroupsController < ApplicationController
  before_action :authenticate_user!

  def create
    group_user = current_user.user_groups.new(group_id: params[:group_id])
    group_user.save
    redirect_to request.referer
  end

  def destroy
    group_user = current_user.user_groups.find_by(group_id: params[:group_id])
    group_user.destroy
    redirect_to request.referer
  end
end
