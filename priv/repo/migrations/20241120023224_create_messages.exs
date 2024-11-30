defmodule MusicCentral.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :message, :string
      add :read, :boolean, default: false, null: false
      add :sender_id, references(:users, on_delete: :nothing)
      add :receiver_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:messages, [:sender_id])
    create index(:messages, [:receiver_id])
  end
end
