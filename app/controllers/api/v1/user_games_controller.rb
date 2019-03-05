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
    ActionCable.server.broadcast("home_channel", {type: 'ADD_PLAYERS', player: @userGame.user})

    #
    # type: 'PLAYER_JOIN',
    #         payload: GameSerializer.new(game_player.game).small_serialize
    #       })
    #       GamesChannel.broadcast_to(game_player.game, {
    #         type: 'NEW_PLAYER',
    #         payload: GamePlayersSerializer.new(game_player).serialize
    #       })

    game = GameSerializer.new(@userGame.game)

    GamesChannel.broadcast_to(game, {message: "hi from game channel"})
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
    getURL = uploadToCloudinary(user_game_params[:imageUrl])
    @userGame.update_attribute(:imageUrl, getURL)
    ActionCable.server.broadcast("home_channel", {type: 'GET_PHOTO', photo: @userGame[:imageUrl]})
    render json: @userGame, status: :ok
  end


  # def destroy
  #   @userGame = UserGame.find(params[:id])
  #   @userGame.destroy
  # end

  private

  def user_game_params
    params.require(:user_game).permit(:id, :user_id, :game_id, :imageUrl)
  end


  def uploadToCloudinary(data)
    Cloudinary::Uploader.upload(data)["url"]
  end



end
