defmodule EastEgg.User do
  @moduledoc false

  use EastEgg, :topic
  alias EastEgg.User

  def start_link(options) do
    Topic.start_link(__MODULE__, options)
  end

  @impl true
  def init(_options) do
    children = [
      User.Subscribes,
      User.Update
    ]

    Topic.init(children)
  end
end
