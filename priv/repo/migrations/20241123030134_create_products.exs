defmodule MusicCentral.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :text
      add :category_id, references(:categories, on_delete: :nothing)
      add :subcategory_id, references(:subcategories, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:products, [:category_id])
    create index(:products, [:subcategory_id])
  end
end
