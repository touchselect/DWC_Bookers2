class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash[:error] = @book.errors.full_messages
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      @book = Book.find(params[:id])
      flash[:error] = book.errors.full_messages
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
