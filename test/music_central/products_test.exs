defmodule MusicCentral.ProductsTest do
  use MusicCentral.DataCase

  alias MusicCentral.Products

  describe "categories" do
    alias MusicCentral.Products.Category

    import MusicCentral.ProductsFixtures

    @invalid_attrs %{name: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Products.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Products.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Category{} = category} = Products.create_category(valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Category{} = category} = Products.update_category(category, update_attrs)
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_category(category, @invalid_attrs)
      assert category == Products.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Products.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Products.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Products.change_category(category)
    end
  end

  describe "subcategories" do
    alias MusicCentral.Products.Subcategory

    import MusicCentral.ProductsFixtures

    @invalid_attrs %{name: nil}

    test "list_subcategories/0 returns all subcategories" do
      subcategory = subcategory_fixture()
      assert Products.list_subcategories() == [subcategory]
    end

    test "get_subcategory!/1 returns the subcategory with given id" do
      subcategory = subcategory_fixture()
      assert Products.get_subcategory!(subcategory.id) == subcategory
    end

    test "create_subcategory/1 with valid data creates a subcategory" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Subcategory{} = subcategory} = Products.create_subcategory(valid_attrs)
      assert subcategory.name == "some name"
    end

    test "create_subcategory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_subcategory(@invalid_attrs)
    end

    test "update_subcategory/2 with valid data updates the subcategory" do
      subcategory = subcategory_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Subcategory{} = subcategory} = Products.update_subcategory(subcategory, update_attrs)
      assert subcategory.name == "some updated name"
    end

    test "update_subcategory/2 with invalid data returns error changeset" do
      subcategory = subcategory_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_subcategory(subcategory, @invalid_attrs)
      assert subcategory == Products.get_subcategory!(subcategory.id)
    end

    test "delete_subcategory/1 deletes the subcategory" do
      subcategory = subcategory_fixture()
      assert {:ok, %Subcategory{}} = Products.delete_subcategory(subcategory)
      assert_raise Ecto.NoResultsError, fn -> Products.get_subcategory!(subcategory.id) end
    end

    test "change_subcategory/1 returns a subcategory changeset" do
      subcategory = subcategory_fixture()
      assert %Ecto.Changeset{} = Products.change_subcategory(subcategory)
    end
  end

  describe "products" do
    alias MusicCentral.Products.Product

    import MusicCentral.ProductsFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.name == "some name"
      assert product.description == "some description"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.name == "some updated name"
      assert product.description == "some updated description"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "product_variants" do
    alias MusicCentral.Products.ProductVariant

    import MusicCentral.ProductsFixtures

    @invalid_attrs %{size: nil, color: nil, price: nil, stock: nil}

    test "list_product_variants/0 returns all product_variants" do
      product_variant = product_variant_fixture()
      assert Products.list_product_variants() == [product_variant]
    end

    test "get_product_variant!/1 returns the product_variant with given id" do
      product_variant = product_variant_fixture()
      assert Products.get_product_variant!(product_variant.id) == product_variant
    end

    test "create_product_variant/1 with valid data creates a product_variant" do
      valid_attrs = %{size: "some size", color: "some color", price: "120.5", stock: 42}

      assert {:ok, %ProductVariant{} = product_variant} = Products.create_product_variant(valid_attrs)
      assert product_variant.size == "some size"
      assert product_variant.color == "some color"
      assert product_variant.price == Decimal.new("120.5")
      assert product_variant.stock == 42
    end

    test "create_product_variant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product_variant(@invalid_attrs)
    end

    test "update_product_variant/2 with valid data updates the product_variant" do
      product_variant = product_variant_fixture()
      update_attrs = %{size: "some updated size", color: "some updated color", price: "456.7", stock: 43}

      assert {:ok, %ProductVariant{} = product_variant} = Products.update_product_variant(product_variant, update_attrs)
      assert product_variant.size == "some updated size"
      assert product_variant.color == "some updated color"
      assert product_variant.price == Decimal.new("456.7")
      assert product_variant.stock == 43
    end

    test "update_product_variant/2 with invalid data returns error changeset" do
      product_variant = product_variant_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product_variant(product_variant, @invalid_attrs)
      assert product_variant == Products.get_product_variant!(product_variant.id)
    end

    test "delete_product_variant/1 deletes the product_variant" do
      product_variant = product_variant_fixture()
      assert {:ok, %ProductVariant{}} = Products.delete_product_variant(product_variant)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product_variant!(product_variant.id) end
    end

    test "change_product_variant/1 returns a product_variant changeset" do
      product_variant = product_variant_fixture()
      assert %Ecto.Changeset{} = Products.change_product_variant(product_variant)
    end
  end

  describe "product_images" do
    alias MusicCentral.Products.ProductImage

    import MusicCentral.ProductsFixtures

    @invalid_attrs %{url: nil, alt: nil, is_default: nil}

    test "list_product_images/0 returns all product_images" do
      product_image = product_image_fixture()
      assert Products.list_product_images() == [product_image]
    end

    test "get_product_image!/1 returns the product_image with given id" do
      product_image = product_image_fixture()
      assert Products.get_product_image!(product_image.id) == product_image
    end

    test "create_product_image/1 with valid data creates a product_image" do
      valid_attrs = %{url: "some url", alt: "some alt", is_default: true}

      assert {:ok, %ProductImage{} = product_image} = Products.create_product_image(valid_attrs)
      assert product_image.url == "some url"
      assert product_image.alt == "some alt"
      assert product_image.is_default == true
    end

    test "create_product_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product_image(@invalid_attrs)
    end

    test "update_product_image/2 with valid data updates the product_image" do
      product_image = product_image_fixture()
      update_attrs = %{url: "some updated url", alt: "some updated alt", is_default: false}

      assert {:ok, %ProductImage{} = product_image} = Products.update_product_image(product_image, update_attrs)
      assert product_image.url == "some updated url"
      assert product_image.alt == "some updated alt"
      assert product_image.is_default == false
    end

    test "update_product_image/2 with invalid data returns error changeset" do
      product_image = product_image_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product_image(product_image, @invalid_attrs)
      assert product_image == Products.get_product_image!(product_image.id)
    end

    test "delete_product_image/1 deletes the product_image" do
      product_image = product_image_fixture()
      assert {:ok, %ProductImage{}} = Products.delete_product_image(product_image)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product_image!(product_image.id) end
    end

    test "change_product_image/1 returns a product_image changeset" do
      product_image = product_image_fixture()
      assert %Ecto.Changeset{} = Products.change_product_image(product_image)
    end
  end
end
