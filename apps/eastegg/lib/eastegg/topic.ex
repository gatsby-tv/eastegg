defmodule EastEgg.Topic do
  @moduledoc false

  def start_link(module, options) do
    Supervisor.start_link(module, options, name: module)
  end

  def init(children, options \\ []) do
    options = Keyword.merge([strategy: :one_for_one], options)
    Supervisor.init(children, options)
  end
end
