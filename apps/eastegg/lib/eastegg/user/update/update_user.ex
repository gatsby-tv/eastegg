defmodule EastEgg.User.Update.UpdateUser do
  @moduledoc false

  use EastEgg, :service

  @routing_key "user.update"

  def start_link(_options) do
    Service.start_link(__MODULE__, routing_key: @routing_key)
  end

  def handle_message(_, message = %Message{data: _data}, _) do
    IO.puts("update user with new data")
    message
  end
end
