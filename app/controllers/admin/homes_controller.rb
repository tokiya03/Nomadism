class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @admin = Admin.find(1)
    @users = User.all.order(id: 'desc')
    @posts = Post.all.order(id: 'desc')
    @comments = Comment.all
    @groups = Group.all
  end
end
