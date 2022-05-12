class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
   if @user.save
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
   else
    @users = User.all
    render :edit
   end
  end

  def index
    @users = User.all
    @book = Book.new
  end

    private
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end

end
