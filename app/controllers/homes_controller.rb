class HomesController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]

  def about
  end


private
  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to  new_user_session_path #ログイン画面へと直ったかな？
    end
  end

end
