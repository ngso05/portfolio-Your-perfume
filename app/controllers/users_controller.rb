class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def unsubscribe
    @user = User.find_by(name: params[:name])
  end

  def withdraw
    @user = User.find_by(name: params[:name])
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :email, :sex)
  end
end
