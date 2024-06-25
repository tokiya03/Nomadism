class Public::ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @messages = @group.chats
    @message = Chat.new

    unless @group.includesUser?(current_user)
      flash[:info] = "グループメンバー以外はチャットルームに入室できません。"
      redirect_to group_path(@group.id)
    end
  end

  def create
    @message = current_user.chats.new(chat_params)
    @message.group_id = params[:group_id]
    if @message.save
      # 後に非同期通信化するので、一時的なリダイレクト設定
      redirect_to request.referer
    else
      @messages = Chat.all
      @group = Group.find(params[:group_id])
      flash.now[:info] = @message.errors.full_messages.first
      render :index
    end
  end

  # ストロングパラメータ
  private
  def chat_params
    params.require(:chat).permit(:message)
  end
end
