defmodule MusicCentral.Products.Subcategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subcategories" do
    field :name, :string

    belongs_to :category, MusicCentral.Products.Category
    has_many :products, MusicCentral.Products.Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(subcategory, attrs) do
    subcategory
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
