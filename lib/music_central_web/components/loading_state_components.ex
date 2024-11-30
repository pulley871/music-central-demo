defmodule MusicCentralWeb.LoadingStateComponents do
  use Phoenix.Component
  alias Phoenix.LiveView.JS
  import MusicCentralWeb.Gettext

  attr :title, :string, default: nil

  def list_skeleton(assigns) do
    ~H"""
    <div
      role="status"
      class={[
        "max-w-full md:max-w-96 md:min-w-96 md:min-h-72 p-4 space-y-4 border border-red-600 rounded-xl shadow animate-pulse dark:divide-red-800 dark:border-red-800 md:p-6",
        @title && "md:py-2 md:px-6"
      ]}
    >
      <%= if @title do %>
        <div>
          <h1 class="text-red-300 dark:text-red-600 text-center font-extrabold text-xl">
            <%= @title %>
          </h1>
        </div>
      <% end %>

      <div class="flex items-center justify-between">
        <div>
          <div class="h-2.5 bg-red-300 rounded-full dark:bg-red-600 w-24 mb-2.5"></div>
          <div class="w-32 h-2 bg-red-200 rounded-full dark:bg-red-700"></div>
        </div>
        <div class="h-2.5 bg-red-300 rounded-full dark:bg-red-700 w-12"></div>
      </div>
      <div class="flex items-center justify-between pt-4">
        <div>
          <div class="h-2.5 bg-red-300 rounded-full dark:bg-red-600 w-24 mb-2.5"></div>
          <div class="w-32 h-2 bg-red-200 rounded-full dark:bg-red-700"></div>
        </div>
        <div class="h-2.5 bg-red-300 rounded-full dark:bg-red-700 w-12"></div>
      </div>
      <div class="flex items-center justify-between pt-4">
        <div>
          <div class="h-2.5 bg-red-300 rounded-full dark:bg-red-600 w-24 mb-2.5"></div>
          <div class="w-32 h-2 bg-red-200 rounded-full dark:bg-red-700"></div>
        </div>
        <div class="h-2.5 bg-red-300 rounded-full dark:bg-red-700 w-12"></div>
      </div>
      <div class="flex items-center justify-between pt-4">
        <div>
          <div class="h-2.5 bg-red-300 rounded-full dark:bg-red-600 w-24 mb-2.5"></div>
          <div class="w-32 h-2 bg-red-200 rounded-full dark:bg-red-700"></div>
        </div>
        <div class="h-2.5 bg-red-300 rounded-full dark:bg-red-700 w-12"></div>
      </div>
      <div class="flex items-center justify-between pt-4">
        <div>
          <div class="h-2.5 bg-red-300 rounded-full dark:bg-red-600 w-24 mb-2.5"></div>
          <div class="w-32 h-2 bg-red-200 rounded-full dark:bg-red-700"></div>
        </div>
        <div class="h-2.5 bg-red-300 rounded-full dark:bg-red-700 w-12"></div>
      </div>
      <span class="sr-only">Loading...</span>
    </div>
    """
  end

  def image_skeleton(assigns) do
    ~H"""
    <div
      role="status"
      class="flex items-center justify-center h-full max-w-sm bg-gray-300 rounded-lg animate-pulse dark:bg-gray-700"
    >
      <svg
        class="w-10 h-10 text-gray-200 dark:text-gray-600"
        aria-hidden="true"
        xmlns="http://www.w3.org/2000/svg"
        fill="currentColor"
        viewBox="0 0 16 20"
      >
        <path d="M5 5V.13a2.96 2.96 0 0 0-1.293.749L.879 3.707A2.98 2.98 0 0 0 .13 5H5Z" />
        <path d="M14.066 0H7v5a2 2 0 0 1-2 2H0v11a1.97 1.97 0 0 0 1.934 2h12.132A1.97 1.97 0 0 0 16 18V2a1.97 1.97 0 0 0-1.934-2ZM9 13a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-2a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2v2Zm4 .382a1 1 0 0 1-1.447.894L10 13v-2l1.553-1.276a1 1 0 0 1 1.447.894v2.764Z" />
      </svg>
      <span class="sr-only">Loading...</span>
    </div>
    """
  end
end
