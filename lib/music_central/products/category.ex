defmodule MusicCentral.Products.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string

    has_many :subcategories, MusicCentral.Products.Subcategory
    has_many :products, MusicCentral.Products.Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
