class UsersController < ApplicationController
  def create 
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id 
      render json: user, status: :created
    else 
      render json: {error: 'Invalid username or password'}, status: :unprocessable_entity 
    end 
  end 

  def show 
    user = User.find_by(username: params[:username])
    if session.include? :user_id 
      render json: user 
    else 
      render json: {error: 'Not authorized'}, status: :unauthorized
    end 
  end 

  private

  def user_params 
    params.permit(:username, :password)
  end 

end
