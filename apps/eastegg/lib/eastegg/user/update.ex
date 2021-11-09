defmodule EastEgg.User.Update do
  @moduledoc false

  use EastEgg, :topic
  alias EastEgg.User.Update

  def start_link(options) do
    Topic.start_link(__MODULE__, options)
  end

  @impl true
  def init(_options) do
    children = [
      Update.UpdateUser
    ]

    Topic.init(children)
  end
end
