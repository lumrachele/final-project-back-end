class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.all
    render json: @games
  end

  def new
    @game = Game.new
    render json: @game, status: :ok

  end

  def create
    @game = Game.create(game_params)
    render json: @game, status: :ok
  end

  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  private

  def game_params
    params.require(:game).permit(:id, :prompt)
  end



end
