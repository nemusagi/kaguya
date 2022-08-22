class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @count = Count.find_by(user_id: current_user.id)
    if @post.save
      @count.increment!(:counts, 1)
    else
      render :new
    end   
  end  

  private

  def post_params
    params.require(:post).permit(
      :title, :text, :kind, :is_published, :genre, {images: []}
    ).merge( user_id: current_user.id)
  end
end
