class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorite_blogs
  end

  def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_path
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_path
  end
end
