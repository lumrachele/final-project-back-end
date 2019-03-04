class Api::V1::GameStatusController < ApplicationController

  def start
    ActionCable.server.broadcast("home_channel", {type: 'GAME_HAS_BEEN_STARTED'})
  end


end
