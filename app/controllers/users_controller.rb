class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @favorites = @user.favorite_blogs
    @favorite_total_counts = Favorite.where(user_id: current_user.id).count
    @favorited_total_counts = Favorite.joins(:blog).where(blogs: {user_id: current_user.id}).count
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_digest, :password_confirmation)
  end
end
