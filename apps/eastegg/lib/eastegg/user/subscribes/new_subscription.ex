defmodule EastEgg.User.Subscribes.NewSubscription do
  @moduledoc false

  use EastEgg, :service

  @routing_key "user.subscribes"
  @query File.read!("#{__DIR__}/new_subscription.cyp")

  def start_link(_options) do
    Service.start_link(__MODULE__, routing_key: @routing_key)
  end

  def handle_message(_, message = %Message{data: _data}, _) do
    IO.puts(@query)
    message
  end
end
