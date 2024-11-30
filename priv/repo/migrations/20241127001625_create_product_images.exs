defmodule MusicCentral.Repo.Migrations.CreateProductImages do
  use Ecto.Migration

  def change do
    create table(:product_images) do
      add :url, :string
      add :alt, :string
      add :is_default, :boolean, default: false, null: false
      add :product_id, references(:products, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:product_images, [:product_id])
  end
end
