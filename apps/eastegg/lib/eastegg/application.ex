defmodule EastEgg.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EastEgg.User
    ]

    :ok = EastEgg.Exchange.init()
    Supervisor.start_link(children, strategy: :one_for_one, name: EastEgg.Supervisor)
  end
end
