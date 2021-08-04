defmodule Rxchange.Repo do
  use Ecto.Repo,
    otp_app: :rxchange,
    adapter: Ecto.Adapters.Postgres
end
