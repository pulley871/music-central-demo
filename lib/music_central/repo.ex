defmodule MusicCentral.Repo do
  use Ecto.Repo,
    otp_app: :music_central,
    adapter: Ecto.Adapters.Postgres
end
