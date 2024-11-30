defmodule MusicCentralWeb.AboutLive.Index do
  use MusicCentralWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.back navigate={~p"/"} class="hover:text-red-700">Back</.back>

    <div class="px-6 py-10 bg-gray-50">
      <div class="flex flex-col gap-12 max-w-4xl mx-auto">
        <!-- Back Button -->
        <!-- Image Section with Caption -->
        <div class="relative shadow-lg">
          <img
            src={~p"/images/musiccentral-building.png"}
            class="rounded-xl w-full"
            alt="Music Central Building"
          />
          <p class="text-sm text-gray-500 text-center mt-2">Visit our store in Hopkinsville, KY</p>
        </div>
        <!-- About Text Section -->
        <div class="flex flex-col gap-6 text-gray-800 leading-relaxed">
          <h1 class="text-3xl font-semibold">Welcome to Music Central</h1>
          <p class="text-lg">
            Music Central is dedicated to bringing you the best brands in the industry, all under one roof. Our 10,000-square-foot store in the heart of Western Kentucky is more than just a shop—it's a hub for musicians to find high-quality gear and expert advice from passionate professionals.
          </p>
          <p class="text-lg">
            To make it even easier for you to bring home the equipment you need, we offer in-store financing through Synchrony Financial. With the Music Central credit card, you can access special payment options, including 6, 12, or even 24-month deferred interest plans on select purchases.
          </p>
          <button class="bg-red-700 text-white px-4 py-2 rounded-lg hover:bg-red-800">
            Learn More About Financing
          </button>
        </div>
        <!-- Location & Hours Section -->
        <div class="bg-white rounded-lg shadow-md p-6 mt-8">
          <h2 class="text-2xl font-bold text-gray-800 mb-4">Our Location & Hours</h2>
          <!-- Address -->
          <div class="mb-6">
            <p class="text-lg font-semibold">Music Central</p>
            <p>
              <a
                href="https://maps.google.com/?q=1811+E+9th+Street,Hopkinsville,KY+42240"
                class="text-blue-600 hover:underline"
                target="_blank"
              >
                1811 E. 9th Street
              </a>
            </p>
            <p>Hopkinsville, KY 42240</p>
          </div>
          <!-- Store Hours with Dynamic Highlight -->
          <div>
            <h3 class="text-xl font-semibold mb-2">Store Hours</h3>
            <div class="flex flex-col space-y-1">
              <p class={highlight_today(:monday)}>
                Monday: <span class="font-medium">9am - 5:30pm</span>
              </p>
              <p class={highlight_today(:tuesday)}>
                Tuesday: <span class="font-medium">9am - 5:30pm</span>
              </p>
              <p class={highlight_today(:wednesday)}>
                Wednesday: <span class="font-medium">9am - 5:30pm</span>
              </p>
              <p class={highlight_today(:thursday)}>
                Thursday: <span class="font-medium">9am - 5:30pm</span>
              </p>
              <p class={highlight_today(:friday)}>
                Friday: <span class="font-medium">9am - 5:30pm</span>
              </p>
              <p class={highlight_today(:saturday)}>
                Saturday: <span class="font-medium">9am - 2pm</span>
              </p>
              <p class={highlight_today(:sunday)}>Sunday: <span class="font-medium">Closed</span></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  # Helper function to highlight today’s hours
  defp highlight_today(day) do
    today_day_of_week = Date.utc_today() |> Date.day_of_week()

    # Map days of the week to integer values starting with Monday as 1
    day_map = %{
      monday: 1,
      tuesday: 2,
      wednesday: 3,
      thursday: 4,
      friday: 5,
      saturday: 6,
      sunday: 7
    }

    if day_map[day] == today_day_of_week do
      "text-red-700 font-bold"
    else
      ""
    end
  end
end
