defmodule MusicCentral.Repo.Migrations.CreateSubcategories do
  use Ecto.Migration

  def change do
    create table(:subcategories) do
      add :name, :string
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:subcategories, [:category_id])
  end
end
