class TopController < ApplicationController
  def index
    @posts = Post.where(is_published: :true).page(params[:page]).per(6).order("created_at DESC")
  end
end
