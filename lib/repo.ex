defmodule Repo do
  use Ecto.Repo, otp_app: :proxylicious, adapter: Sqlite.Ecto
end