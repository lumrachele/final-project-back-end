class HomeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "home_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
