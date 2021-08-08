class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  def show
    @user = current_user
    @user = User.find(params[:id])
    #@users = @user.users.page(params[:page]).reverse_order
    @books = @user.books.all
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless current_user.id == @user.id
  end
  
  def update
    #@user = current_user
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end