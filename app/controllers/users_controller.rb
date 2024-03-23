class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:name).permit(:name, :profile_image, :introduction)
  end
end
