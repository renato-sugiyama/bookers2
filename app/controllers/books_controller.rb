class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @book_data = Book.find(params[:id])
    @user = User.find_by(id: @book_data.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(post_book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render "books/edit"
    end
  end

  def create
    @book = Book.new(post_book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: "You have creatad book successfully."
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render "books/index"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  def ensure_correct_user
    book = Book.find(params[:id])
    if current_user.id != book.user_id
      redirect_to books_path
    end
  end

  private
  def post_book_params
    params.require(:book).permit(:title, :body)
  end

end
