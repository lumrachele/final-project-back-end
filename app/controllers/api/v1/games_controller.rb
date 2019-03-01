class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.all
    render json: @games
  end

  def new
    @game = Game.new

  end

  def create
    @game = Game.create()
    render json: @game, status: :ok
  end

  def show
    @game = Game.find(params[:id])
    # ActionCable.server.broadcast("home_channel", {hello:"me"})
    render json: @game, status: :ok
  end

  private

  def game_params
    params.require(:game).permit(:id)
  end

  # def assignPrompt
  #   Caption.all.sample.text
  # end
end
