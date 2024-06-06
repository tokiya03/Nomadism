class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when User
      mypage_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  add_flash_types :secondary, :success, :danger, :warning, :info, :light, :dark

  # devise版ストロングパラメータ
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
