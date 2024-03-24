class BooksController < ApplicationController
  def new
     @book = Book.new
  end

  def index
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @list = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end


  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end
  

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
   def user_params
    params.require(:name).permit(:name, :profile_image, :introduction)
  end
  
end
