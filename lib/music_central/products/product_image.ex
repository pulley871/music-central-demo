defmodule MusicCentral.Products.ProductImage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_images" do
    field :url, :string
    field :alt, :string
    field :is_default, :boolean, default: false
    field :product_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product_image, attrs) do
    product_image
    |> cast(attrs, [:url, :alt, :is_default])
    |> validate_required([:url, :alt, :is_default])
  end
end
