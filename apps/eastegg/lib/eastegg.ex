defmodule EastEgg do
  @moduledoc """
  Configuration setups for EastEgg.
  To utilize a configuration, use in a module as:

      use EastEgg, :topic
      use EastEgg, :service
  """

  def topic do
    quote do
      use Supervisor
      alias EastEgg.Topic
    end
  end

  def service do
    quote do
      use Broadway
      alias Broadway.Message
      alias EastEgg.Service
    end
  end

  @doc """
  When used, dispatch to the appropriate configuration above.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
