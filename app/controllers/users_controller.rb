class UsersController < ApplicationController
  before_action :set_user, only: :show
  def show

  end

  private
  def set_user
    @user = User.find(params[:id])
    if current_user.id == @user.id
      @posts = @user.posts
    else
      @user.posts.where(is_published: :true)
    end
  end

end
