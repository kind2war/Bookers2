class BooksController < ApplicationController

  #投稿データの作成
  def new
    @book = Book.new
  end

  #投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save #!
      flash[:notice]="Book was successfully created !"
      redirect_to books_path()
    else
      render :new
    end
  end

  def index
    @books = Book.all
    @user = current_user

  end

  def show
    @books = Book.find(params[:id])
    @user = @books.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice]="Book was successfully updated !"
      redirect_to book_path(book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  # 投稿データのストロングパラメータ
  private
    def book_params
      params.require(:book).permit(:title, :opinion)
    end
end