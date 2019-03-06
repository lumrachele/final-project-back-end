class Api::V1::GameStatusController < ApplicationController

  def start
    ActionCable.server.broadcast("home_channel", {type: 'GAME_HAS_BEEN_STARTED'})
  end

  def submissions
    ActionCable.server.broadcast("home_channel", {type: 'GO_TO_SUBMISSIONS'})
  end

  def voting
    ActionCable.server.broadcast("home_channel", {type: 'GO_TO_VOTING'})
  end

  def results
    ActionCable.server.broadcast("home_channel", {type: 'GO_TO_RESULTS'})
  end

  def resultsWithId
    @game = Game.find(params[:id])
    # byebug
    ActionCable.server.broadcast("home_channel", {type: 'RESULTS_WITH_ID', game: GameSerializer.new(@game)})
    # render json: GameSerializer.new(@game), status: :ok
  end

  def anotherGame
    ActionCable.server.broadcast("home_channel", {type: 'ANOTHER_GAME'})
  end

end
