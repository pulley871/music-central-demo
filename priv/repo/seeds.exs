alias MusicCentral.Repo
alias MusicCentral.Products

# Create Categories
{:ok, guitars} = Products.create_category(%{name: "Guitars"})
{:ok, pianos} = Products.create_category(%{name: "Pianos"})
{:ok, drums} = Products.create_category(%{name: "Drums"})

# Create Subcategories for each category
guitar_subcategories = [
  Products.create_subcategory(guitars, %{name: "Brands"}),
  Products.create_subcategory(guitars, %{name: "Electric"}),
  Products.create_subcategory(guitars, %{name: "Acoustic"})
]

piano_subcategories = [
  Products.create_subcategory(pianos, %{name: "Grand"}),
  Products.create_subcategory(pianos, %{name: "Upright"}),
  Products.create_subcategory(pianos, %{name: "Digital"})
]

drum_subcategories = [
  Products.create_subcategory(drums, %{name: "Sets"}),
  Products.create_subcategory(drums, %{name: "Snare"}),
  Products.create_subcategory(drums, %{name: "Cymbals"})
]

# Categories and Subcategories mapping
categories_with_subcategories = [
  {guitars, guitar_subcategories, ["Fender", "Gibson", "Ibanez"]},
  {pianos, piano_subcategories, ["Steinway", "Yamaha", "Casio"]},
  {drums, drum_subcategories, ["Pearl", "Tama", "Ludwig"]}
]

# Create 20 Products with Variants
Enum.each(1..1000, fn product_index ->
  # Select a random category, subcategory, and brand
  {category, subcategories, brands} = Enum.random(categories_with_subcategories)
  {:ok, subcategory} = Enum.random(subcategories)
  brand = Enum.random(brands)

  # Generate Product Name
  product_name = "#{brand} #{subcategory.name} #{category.name}"

  # Create Product
  {:ok, product} =
    Products.create_product(%{
      name: product_name,
      description: "High-quality #{category.name} from #{brand}.",
      category_id: category.id,
      subcategory_id: subcategory.id
    })

  # Create a dummy image for the product
  Products.create_product_image(product, %{
    url: "https://avatar.iran.liara.run/public",
    alt: "Image of #{product_name}",
    is_default: true
  })

  # Create 3 Variants for the Product
  Enum.each(1..3, fn variant_index ->
    Products.create_product_variant(%{
      product_id: product.id,
      size: "Size #{variant_index}",
      color: "Color #{variant_index}",
      price: 20.00 + variant_index,
      stock: 10 * variant_index
    })
  end)
end)
