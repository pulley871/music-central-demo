defmodule MusicCentral.Products.ProductVariant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_variants" do
    field :size, :string
    field :color, :string
    field :price, :decimal
    field :stock, :integer

    belongs_to :product, MusicCentral.Products.Product, foreign_key: :product_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product_variant, attrs) do
    product_variant
    |> cast(attrs, [:size, :color, :price, :stock, :product_id])
    |> validate_required([:size, :color, :price, :stock])
  end
end
