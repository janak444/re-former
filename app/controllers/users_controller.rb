# frozen_string_literal: true

# User controller to control all the activities
class UsersController < ApplicationController
  def new
    
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
