defmodule LemonadeStand.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [LemonadeStand.Repo]

    opts = [strategy: :one_for_one, name: LemonadeStand.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
