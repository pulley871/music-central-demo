defmodule MusicCentral.Products do
  @moduledoc """
  The Products context.
  """

  import Ecto.Query, warn: false
  alias MusicCentral.Repo

  alias MusicCentral.Products.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  def list_categories_for_form do
    Repo.all(Category) |> Enum.map(&{&1.name, &1.id})
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias MusicCentral.Products.Subcategory

  @doc """
  Returns the list of subcategories.

  ## Examples

      iex> list_subcategories()
      [%Subcategory{}, ...]

  """
  def list_subcategories do
    Repo.all(Subcategory)
  end

  def list_subcategories_for_form_by_category_id(category_id) do
    Subcategory
    |> where(category_id: ^category_id)
    |> Repo.all()
    |> Enum.map(&{&1.name, &1.id})
  end

  @doc """
  Gets a single subcategory.

  Raises `Ecto.NoResultsError` if the Subcategory does not exist.

  ## Examples

      iex> get_subcategory!(123)
      %Subcategory{}

      iex> get_subcategory!(456)
      ** (Ecto.NoResultsError)

  """
  def get_subcategory!(id), do: Repo.get!(Subcategory, id)

  @doc """
  Creates a subcategory.

  ## Examples

      iex> create_subcategory(%{field: value})
      {:ok, %Subcategory{}}

      iex> create_subcategory(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # def create_subcategory(attrs \\ %{}) do
  #   %Subcategory{}
  #   |> Subcategory.changeset(attrs)
  #   |> Repo.insert()
  # end
  def create_subcategory(category, attrs \\ %{}) do
    category
    |> Ecto.build_assoc(:subcategories, attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a subcategory.

  ## Examples

      iex> update_subcategory(subcategory, %{field: new_value})
      {:ok, %Subcategory{}}

      iex> update_subcategory(subcategory, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_subcategory(%Subcategory{} = subcategory, attrs) do
    subcategory
    |> Subcategory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a subcategory.

  ## Examples

      iex> delete_subcategory(subcategory)
      {:ok, %Subcategory{}}

      iex> delete_subcategory(subcategory)
      {:error, %Ecto.Changeset{}}

  """
  def delete_subcategory(%Subcategory{} = subcategory) do
    Repo.delete(subcategory)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking subcategory changes.

  ## Examples

      iex> change_subcategory(subcategory)
      %Ecto.Changeset{data: %Subcategory{}}

  """
  def change_subcategory(%Subcategory{} = subcategory, attrs \\ %{}) do
    Subcategory.changeset(subcategory, attrs)
  end

  alias MusicCentral.Products.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  def list_products(params) do
    base_product_query()
    |> apply_filters(params)
    |> preload([:subcategory, :images])
    |> Repo.all()
  end

  defp apply_filters(query, params) do
    Enum.reduce(params, query, fn
      {"category_id", _value}, query -> filter_by_category(query, params)
      {"subcategory_id", _value}, query -> filter_by_subcategory(query, params)
      {"q", _value}, query -> filter_by_name(query, params)
      # Add more filter functions here as needed
      _other, query -> query
    end)
  end

  def base_product_query do
    from(p in Product)
  end

  defp filter_by_name(query, %{"q" => q})
       when is_binary(q) do
    from(p in query,
      join: c in assoc(p, :category),
      where: ilike(p.name, ^"%#{q}%")
    )
  end

  defp filter_by_name(query, _), do: query

  defp filter_by_category(query, %{"category_id" => category_id})
       when is_binary(category_id) do
    from(p in query,
      join: c in assoc(p, :category),
      where: c.id == ^category_id
    )
  end

  defp filter_by_category(query, _), do: query

  defp filter_by_subcategory(query, %{"subcategory_id" => subcategory_id})
       when is_binary(subcategory_id) do
    from(p in query,
      join: sc in assoc(p, :subcategory),
      where: sc.id == ^subcategory_id
    )
  end

  defp filter_by_subcategory(query, _), do: query

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  alias MusicCentral.Products.ProductVariant

  @doc """
  Returns the list of product_variants.

  ## Examples

      iex> list_product_variants()
      [%ProductVariant{}, ...]

  """
  def list_product_variants do
    Repo.all(ProductVariant)
  end

  @doc """
  Gets a single product_variant.

  Raises `Ecto.NoResultsError` if the Product variant does not exist.

  ## Examples

      iex> get_product_variant!(123)
      %ProductVariant{}

      iex> get_product_variant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product_variant!(id), do: Repo.get!(ProductVariant, id)

  @doc """
  Creates a product_variant.

  ## Examples

      iex> create_product_variant(%{field: value})
      {:ok, %ProductVariant{}}

      iex> create_product_variant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product_variant(attrs \\ %{}) do
    %ProductVariant{}
    |> ProductVariant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product_variant.

  ## Examples

      iex> update_product_variant(product_variant, %{field: new_value})
      {:ok, %ProductVariant{}}

      iex> update_product_variant(product_variant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product_variant(%ProductVariant{} = product_variant, attrs) do
    product_variant
    |> ProductVariant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product_variant.

  ## Examples

      iex> delete_product_variant(product_variant)
      {:ok, %ProductVariant{}}

      iex> delete_product_variant(product_variant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product_variant(%ProductVariant{} = product_variant) do
    Repo.delete(product_variant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product_variant changes.

  ## Examples

      iex> change_product_variant(product_variant)
      %Ecto.Changeset{data: %ProductVariant{}}

  """
  def change_product_variant(%ProductVariant{} = product_variant, attrs \\ %{}) do
    ProductVariant.changeset(product_variant, attrs)
  end

  alias MusicCentral.Products.ProductImage

  @doc """
  Returns the list of product_images.

  ## Examples

      iex> list_product_images()
      [%ProductImage{}, ...]

  """
  def list_product_images do
    Repo.all(ProductImage)
  end

  @doc """
  Gets a single product_image.

  Raises `Ecto.NoResultsError` if the Product image does not exist.

  ## Examples

      iex> get_product_image!(123)
      %ProductImage{}

      iex> get_product_image!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product_image!(id), do: Repo.get!(ProductImage, id)

  @doc """
  Creates a product_image.

  ## Examples

      iex> create_product_image(%{field: value})
      {:ok, %ProductImage{}}

      iex> create_product_image(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product_image(product, attrs \\ %{}) do
    product
    |> Ecto.build_assoc(:images, attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product_image.

  ## Examples

      iex> update_product_image(product_image, %{field: new_value})
      {:ok, %ProductImage{}}

      iex> update_product_image(product_image, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product_image(%ProductImage{} = product_image, attrs) do
    product_image
    |> ProductImage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product_image.

  ## Examples

      iex> delete_product_image(product_image)
      {:ok, %ProductImage{}}

      iex> delete_product_image(product_image)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product_image(%ProductImage{} = product_image) do
    Repo.delete(product_image)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product_image changes.

  ## Examples

      iex> change_product_image(product_image)
      %Ecto.Changeset{data: %ProductImage{}}

  """
  def change_product_image(%ProductImage{} = product_image, attrs \\ %{}) do
    ProductImage.changeset(product_image, attrs)
  end
end
