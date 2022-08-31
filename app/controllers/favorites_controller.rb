class FavoritesController < ApplicationController

  def create
    @post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.save
    redirect_to post_path(params[:post_id]) 
  end
  def destroy
    @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_favorite.destroy
    redirect_to post_path(params[:post_id]) 
  end

  def index
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    posts_list = Post.find(favorites)
    @posts = Kaminari.paginate_array(posts_list).page(params[:page]).per(10)
  end
end
