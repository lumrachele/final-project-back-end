class Api::V1::UserGamesController < ApplicationController
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

  def destroy
    @userGame = UserGame.find(params[:id])
    @userGame.destroy

  end

  private

  def user_game_params
    params.require(:user_game).permit(:id, :user_id, :game_id, :imageUrl)
  end



end
