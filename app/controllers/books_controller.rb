class BooksController < ApplicationController
    protect_from_forgery
    before_action :correct_user, only: [:edit, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     @user = current_user
     render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end


  def show
    @user = current_user
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
   if @book.save
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
   else
     @books = Book.all
     render :edit
   end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
     flash[:notice] = "Book was successfully destroyed."
     redirect_to '/books'
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
