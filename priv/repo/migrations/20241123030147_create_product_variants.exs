defmodule MusicCentral.Repo.Migrations.CreateProductVariants do
  use Ecto.Migration

  def change do
    create table(:product_variants) do
      add :size, :string
      add :color, :string
      add :price, :decimal
      add :stock, :integer
      add :product_id, references(:products, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:product_variants, [:product_id])
  end
end
