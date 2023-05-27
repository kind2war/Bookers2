class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource) #サインイン後どこへ遷移するか設定できるメソッド
    mypage_path(resource)
  end

  def after_sign_out_path_for(resource)
    about_path  #サインアウト後。Aboutページへ飛ぶ
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
