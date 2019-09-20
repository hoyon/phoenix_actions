defmodule PhoenixActions.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_actions,
    adapter: Ecto.Adapters.Postgres
end
