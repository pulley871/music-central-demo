defmodule MusicCentral.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MusicCentral.Products` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MusicCentral.Products.create_category()

    category
  end

  @doc """
  Generate a subcategory.
  """
  def subcategory_fixture(attrs \\ %{}) do
    {:ok, subcategory} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MusicCentral.Products.create_subcategory()

    subcategory
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> MusicCentral.Products.create_product()

    product
  end

  @doc """
  Generate a product_variant.
  """
  def product_variant_fixture(attrs \\ %{}) do
    {:ok, product_variant} =
      attrs
      |> Enum.into(%{
        color: "some color",
        price: "120.5",
        size: "some size",
        stock: 42
      })
      |> MusicCentral.Products.create_product_variant()

    product_variant
  end

  @doc """
  Generate a product_image.
  """
  def product_image_fixture(attrs \\ %{}) do
    {:ok, product_image} =
      attrs
      |> Enum.into(%{
        alt: "some alt",
        is_default: true,
        url: "some url"
      })
      |> MusicCentral.Products.create_product_image()

    product_image
  end
end
