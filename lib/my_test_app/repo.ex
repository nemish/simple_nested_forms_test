defmodule MyTestApp.Repo do
  use Ecto.Repo,
    otp_app: :my_test_app,
    adapter: Ecto.Adapters.Postgres
end
