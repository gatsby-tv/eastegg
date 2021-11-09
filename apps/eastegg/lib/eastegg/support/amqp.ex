defmodule EastEgg.Support.AMQP do
  def open() do
    with {:ok, conn} <- AMQP.Connection.open() do
      AMQP.Channel.open(conn)
    end
  end

  def publish(channel, routing_key, payload, options \\ []) do
    AMQP.Basic.publish(
      channel,
      Application.fetch_env!(:eastegg, :exchange),
      routing_key,
      payload,
      options
    )
  end
end
