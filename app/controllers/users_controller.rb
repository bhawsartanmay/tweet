class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:type] == "my_followers"
      @users = current_user.followers.where.not(id: current_user.id)
    elsif params[:type] == "my_followings"
      @users = current_user.followings.where.not(id: current_user.id)
    else
      @users = User.where.not(id: current_user.id)
    end
  end

  def follow
    current_user.follow(user_params[:user_id])
    redirect_to users_path, :notice => "Successfully followed"
  end

  def unfollow
    current_user.unfollow(user_params[:user_id])
    redirect_to users_path, :notice => "Successfully unfollowed"
  end

  private

  def user_params
    params.permit(:user_id)
  end
end
