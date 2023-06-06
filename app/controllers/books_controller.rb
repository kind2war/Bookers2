class BooksController < ApplicationController
before_action :authenticate_user!, except: [:top, :about]


  #投稿データの作成
  def new
    @book = Book.new
  end

  #投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="Book was successfully created !"
      redirect_to @book
    else
      render :new
    end
  end

  def index
    @books = Book.order("id DESC").page(params[:page]) #ページネーション機能
    @user = current_user
    @book = Book.new

  end

  def show
    @books = Book.find(params[:id])
    @user = @books.user
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated !"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] ="Book was successfully destroyed !"
    redirect_to '/books'
  end

  # 投稿データのストロングパラメータ
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end