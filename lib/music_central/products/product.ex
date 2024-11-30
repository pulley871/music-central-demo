defmodule MusicCentral.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string

    belongs_to :category, MusicCentral.Products.Category, foreign_key: :category_id
    belongs_to :subcategory, MusicCentral.Products.Subcategory, foreign_key: :subcategory_id
    has_many :images, MusicCentral.Products.ProductImage
    has_many :variants, MusicCentral.Products.ProductVariant

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :category_id, :subcategory_id])
    |> validate_required([:name, :description])
  end
end
