defmodule YatzyScoreCard.Server do
  use GenServer

  @self __MODULE__

  # Client

  def start_link(default), do: GenServer.start_link(@self, default, [name: @self])

  def register(player, round), do: GenServer.call(@self, round)

  # Server

  def handle_call({type, score}, player, []) do
    found_type = Agent.get(YatzyScoreCard.Agent, fn map ->
      type in Map.keys(map)
      {:reply, map, []}
    end)
  end
end
