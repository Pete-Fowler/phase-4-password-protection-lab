class UsersController < ApplicationController
  def create 
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id 
      render json: user
    else 
      render json: {error: 'Invalid username or password'}, status: :unprocessable_entity 
    end 
  end 

  private

  def user_params 
    params.permit(:username, :password)
  end 

end
