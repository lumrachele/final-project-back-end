class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end


  def create
    @user = User.create(user_params)
    render json: @user, status: :ok
  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  #
  # end

  private

  def user_params
    params.require(:user).permit(:id, :username, :isHost)
  end
end
