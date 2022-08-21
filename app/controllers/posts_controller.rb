class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create

  end  

  private

  def post_params
    params.require(post).permit(:title, :text, :type, :is_published, :genre, {images: []}).merge(user_id: current_user.id)
end
