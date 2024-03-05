# frozen_string_literal: true

# User controller to control all the activities
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      id = @user.id
      redirect_to user_path(id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    id = params.extract_value(:id)
    @user = User.find(id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_path, status: :see_other
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end
end
