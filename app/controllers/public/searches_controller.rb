class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @search_query = params[:word]  # 検索キーワードを受け取る
    if @search_query.start_with?('@')  # 検索キーワードの先頭が＠から始まるかどうかをチェック
      @users = User.where("name LIKE ?", "#{@search_query[1..-1]}%")  # 前方一致でユーザーを検索
      @no_results = @users.empty?  # ユーザーの検索結果が空かどうかを判定
      render :users_search_results
    else
      @posts = Post.where(
        "name LIKE ? OR caption LIKE ? OR address LIKE ?",            # 部分一致で投稿(場所名/説明(感想)/住所)を検索
        "%#{@search_query}%", "%#{@search_query}%", "%#{@search_query}%"
      )
      @no_results = @posts.empty?  # 投稿の検索結果が空かどうかを判定
      render :posts_search_results
    end
  end
end
