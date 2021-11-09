defmodule EastEgg.Service do
  @moduledoc false

  defp merge_options(left, right) do
    Keyword.merge(left, right, &merge_resolve/3)
  end

  defp merge_resolve(_key, left = [], right = []) do
    merge_options(left, right)
  end

  defp merge_resolve(_key, _left, right) do
    right
  end

  def start_link(module, options \\ []) do
    {queue, options} = Keyword.pop(options, :queue, "")
    {declare, options} = Keyword.pop(options, :declare, [])
    {binding, options} = Keyword.split(options, [:routing_key, :no_wait, :arguments])

    [
      name: module,
      producer: [
        module:
          {BroadwayRabbitMQ.Producer,
           queue: queue,
           bindings: [
             {Application.fetch_env!(:eastegg, :exchange), binding}
           ],
           declare: merge_options([exclusive: true], declare),
           qos: [
             prefetch_count: 50
           ]},
        concurrency: 1
      ],
      processors: [
        default: [
          concurrency: 50
        ]
      ]
    ]
    |> merge_options(options)
    |> (&Broadway.start_link(module, &1)).()
  end
end
