defmodule EastEgg.User.Subscribes.SharedSubscribers do
  @moduledoc false

  use EastEgg, :service

  @routing_key "user.subscribes"

  def start_link(_options) do
    Service.start_link(__MODULE__, routing_key: @routing_key)
  end

  def handle_message(_, message = %Message{data: _data}, _) do
    IO.puts("user's subscribed channels now share a subscriber with a new channel")
    message
  end
end
