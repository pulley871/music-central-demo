defmodule MusicCentralWeb.StoreLive.Index do
  alias MusicCentral.Products.Product
  alias MusicCentral.Products
  use MusicCentralWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :subcategories, nil)
    {:ok, socket, layout: {MusicCentralWeb.Layouts, :store}}
  end

  def handle_params(params, _uri, socket) do
    category_id = Map.get(params, "category_id")

    subcategories =
      if category_id do
        Products.list_subcategories_for_form_by_category_id(category_id)
      else
        []
      end

    IO.inspect(subcategories)
    IO.inspect(Products.list_products(params) |> List.first())

    socket =
      socket
      |> stream(:products, Products.list_products(params), reset: true)
      |> assign(:form, to_form(params))
      |> assign(:subcategories, subcategories)

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col md:block">
      <.form
        for={@form}
        phx-change="filter"
        id="filter-form"
        class="flex gap-2 mb-6 justify-center items-center"
      >
        <.input field={@form[:q]} placeholder="Search..." autocomplete="off" phx-debounce="1000" />
        <.input
          type="select"
          field={@form[:category_id]}
          prompt="Category"
          options={Products.list_categories_for_form()}
        />
        <.input
          type="select"
          field={@form[:subcategory_id]}
          prompt="Subcategory"
          options={@subcategories}
          disabled={Enum.empty?(@subcategories)}
        />
        <.link patch={~p"/store"}>Reset</.link>
      </.form>
      <div class="products" id="products" phx-update="stream">
        <div class="flex flex-wrap gap-6 justify-center">
          <div id="empty" class="no-results only:block hidden">
            No products found. Try changing your filters.
          </div>
          <.product_block :for={{id, product} <- @streams.products} id={id} product={product} />
        </div>
      </div>
    </div>
    """
  end

  attr :id, :string
  attr :product, Product

  def product_block(assigns) do
    ~H"""
    <div
      id={@id}
      class="w-full hover:cursor-pointer flex flex-col md:w-2/6 lg:w-3/ rounded-xl hover:shadow-2xl transition-shadow duration-300 h-[24rem]"
    >
      <!-- Image Skeleton Placeholder -->
      <div>
        <div class=" h-72 bg-gray-200 rounded-xl overflow-hidden">
          <%= if Enum.empty?(@product.images) do %>
            <.image_skeleton />
          <% else %>
            <img
              src={List.first(@product.images).url}
              class={[
                "transition-opacity duration-300",
                (true && "opacity-100") || "opacity-0"
              ]}
            />
          <% end %>
        </div>
      </div>
      <!-- Product Information -->
      <div class="mt-2 px-2">
        <h3 class="text-sm font-semibold text-gray-500"><%= @product.subcategory.name %></h3>

        <h3 class="text-md font-bold text-gray-800 leading-tight">
          <%= @product.name %>
        </h3>
        <p class="text-sm text-indigo-600 mt-3">Price $20.00</p>
      </div>
    </div>
    """
  end

  def handle_event("filter", form_params, socket) do
    form_params =
      form_params
      |> Map.take(~w(q category_id subcategory_id sort_by q))
      |> Map.reject(fn {_, v} -> v == "" end)

    socket = push_patch(socket, to: ~p"/store?#{form_params}")
    {:noreply, socket}
  end
end
