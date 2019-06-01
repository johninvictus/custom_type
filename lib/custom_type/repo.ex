defmodule CustomType.Repo do
  use Ecto.Repo,
    otp_app: :custom_type,
    adapter: Ecto.Adapters.Postgres
end
