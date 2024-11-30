defmodule MusicCentral.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :type, :string
      add :sub_type, :string
      add :scheduled_at, :utc_datetime
      add :completed, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
