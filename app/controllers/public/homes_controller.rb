class Public::HomesController < ApplicationController
  def top
    @posts = Post.all.order(id: 'desc').limit(4)
  end

  def about
  end
end
