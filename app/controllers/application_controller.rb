class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
before_action :authenticate_user!, except: [:top, :about]

  def after_sign_in_path_for(resource) #サインイン後どこへ遷移するか設定できるメソッド
    mypage_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path  #サインアウト後。Aboutページへ飛ぶ
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app', 'assets', 'images', 'sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
