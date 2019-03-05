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

end
