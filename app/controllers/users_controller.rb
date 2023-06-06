class UsersController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]
before_action :authenticate_user!, except: [:top, :about]

  def set_current_user
    @current_user=User.find_by(id :session[:user_id])
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]) #ページネーション機能
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice]="successfully updated !"
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  def index
    @users = User.page(params[:page]) #ページネーション機能
    @user = current_user
    @book = Book.new
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

  def is_matching_login_user
    @user = User.find(params[:id])
    if @current_user==nil
      redirect_to  new_user_session_path #ログイン画面へと直ったかな？
    end

  end

end
