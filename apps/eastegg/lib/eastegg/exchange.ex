defmodule EastEgg.Exchange do
  @moduledoc false

  def init() do
    with {:ok, conn} <- AMQP.Connection.open(),
         {:ok, channel} <- AMQP.Channel.open(conn) do
      AMQP.Exchange.topic(
        channel,
        Application.fetch_env!(:eastegg, :exchange),
        Application.get_env(:eastegg, :declare, [])
      )
    end
  end
end
