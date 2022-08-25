class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :show, :edit, :destroy ]
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :move_to_index, only:  [ :edit, :update, :destroy ]
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
  
  def show
    if @post.is_published == false && @post.user != current_user
        redirect_to root_path
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(
      :title, :text, :kind, :is_published, :genre, {images: []}
    ).merge( user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless  current_user.id ==  @post.user_id
      redirect_to root_path
    end
  end
end
