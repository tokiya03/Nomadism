class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @admin = Admin.find(1)
    @users = User.all
    @posts = Post.all
  end
end
