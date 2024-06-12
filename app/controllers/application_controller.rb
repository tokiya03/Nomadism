class ApplicationController < ActionController::Base

  # フラッシュメッセージの種類を追加する記述
  add_flash_types :success, :info, :warning, :danger

end
