defmodule YatzyScoreCard do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      worker(YatzyScoreCard.Server, [[]]),
      worker(YatzyScoreCard.Agent, [])
    ]

    opts = [strategy: :one_for_one, name: YatzyScoreCard.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

