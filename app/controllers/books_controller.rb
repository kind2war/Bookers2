class BooksController < ApplicationController

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
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :new
    end
  end

  def index
    @book  = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
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