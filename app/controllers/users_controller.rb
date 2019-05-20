class UsersController < ApplicationController
  
  def index
    @users = User.all
    render json: @users 
  end 

  def show
    @user = User.find(params[:id])
    if @user 
      if curr_user.id == @user.id 
        render json: @user
      else
        render json: {errors: "Unable to access this page"}
      end
    else
      render json: {errors: "User not found."}
    end 
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :ok
    else
      render json: {error: @user.errors.full_messages}
    end 
  end 

  private

  def user_params
    params.require(:user).permit(:username, :color)
  end 

end