class UsersController < ApplicationController
  before_action :set_user, only: :show
  def show

  end

  private
  def set_user
    @user = User.find(params[:id])
    if current_user.id == @user.id
      @posts = @user.posts.page(params[:page]).per(6).order("created_at DESC")
    else
      @posts = @user.posts.where(is_published: :true).page(params[:page]).per(6).order("created_at DESC")
    end
  end

end
