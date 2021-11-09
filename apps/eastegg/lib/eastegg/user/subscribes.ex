defmodule EastEgg.User.Subscribes do
  @moduledoc false

  use EastEgg, :topic
  alias EastEgg.User.Subscribes

  def start_link(options) do
    Topic.start_link(__MODULE__, options)
  end

  @impl true
  def init(_options) do
    children = [
      Subscribes.NewSubscription,
      Subscribes.SharedSubscribers
    ]

    Topic.init(children)
  end
end
