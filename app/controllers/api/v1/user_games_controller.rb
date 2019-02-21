require "base64"
class Api::V1::UserGamesController < ApplicationController

  before_action :check_configuration

  def check_configuration
    render 'configuration_missing' if Cloudinary.config.api_key.blank?
  end

  def index
    @userGames = UserGame.all
    render json: @userGames
  end

  def new
    @userGame = UserGame.new
    render json: @userGame, status: :ok

  end

  def create
    @userGame = UserGame.create(user_game_params)
    render json: @userGame, status: :ok
  end

  def show
    @userGame = UserGame.find(params[:id])
    render json: @userGame
  end

  def edit
    @userGame = UserGame.find(params[:id])
    render json: @userGame
  end

  def update
    @userGame = UserGame.find(params[:id])
    # @userGame.update(user_game_params)
    # byebug
    getURL = uploadToCloudinary(user_game_params[:imageUrl])
    @userGame.update_attribute(:imageUrl, getURL)
    # byebug
    render json: @userGame, status: :ok
  end



  def destroy
    @userGame = UserGame.find(params[:id])
    @userGame.destroy

  end

  private

  def user_game_params
    params.require(:user_game).permit(:id, :user_id, :game_id, :imageUrl)
  end


  def uploadToCloudinary(data)
    Cloudinary::Uploader.upload(data)["url"]
  end



end
