class UsersController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update]
before_action :authenticate_user!, except: [:top, :about]

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
    @user.update(user_params)
    redirect_to user_path(@user.id)
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
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
