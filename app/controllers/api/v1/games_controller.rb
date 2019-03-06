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

    # @join = UserGame.create(game_id: @game.id, user_id: game_params[:isActive])

    # ActionCable.server.broadcast("home_channel", {type: 'RERENDER GAME', game: GameSerializer.new(@game)})

    # GamesChannel.broadcast_to(@game, {message: 'hello from games channel'})
    render json: GameSerializer.new(@game), status: :ok
  end

  def show
    @game = Game.find(params[:id])
    ActionCable.server.broadcast("home_channel", {type: 'RERENDER GAME', game: GameSerializer.new(@game)})
    render json: GameSerializer.new(@game), status: :ok
  end

  private

  def game_params
    params.require(:game).permit(:id, :isActive)
  end

  # def assignPrompt
  #   Caption.all.sample.text
  # end
end
