class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new
    render json: @user, status: :ok

  end

  def create
    @user = User.create(user_params)
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

  end

  private

  def user_params
    params.require(:user).permit(:id, :username)
  end
end
