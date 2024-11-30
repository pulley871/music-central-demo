defmodule MusicCentralWeb.LessonsLive.Index do
  use MusicCentralWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col gap-8">
      <.back navigate={~p"/"} class="hover:text-red-700">Back</.back>
      <div class="shadow-xl">
        <img src={~p"/images/recital.jpg"} class="rounded-xl" />
      </div>
      <div class="p-8 max-w-2xl mx-auto">
        <h2 class="text-3xl font-bold text-gray-800 mb-4">Welcome to Music Central Academy!</h2>
        <p class="text-gray-700 mb-4">
          Music Central is proud to announce the addition of Music Central Academy! With our new building, acquired in 2018, we’re excited to offer an in-house lesson academy where musicians of all ages can learn from our knowledgeable and experienced staff.
        </p>

        <h3 class="text-2xl font-semibold text-gray-800 mb-2">Lessons Offered</h3>
        <p class="text-gray-700 mb-6">
          Music Central Academy currently offers lessons for guitar, bass, drums, piano, and any beginning band instrument! We have four talented teachers ready to help you or your child start or continue your musical journey.
        </p>

        <h3 class="text-xl font-semibold text-gray-800 mb-2">Contact Us</h3>
        <p class="text-gray-700 mb-4">
          For more information, please reach out to our academy coordinator, Corey Thomas:
        </p>
        <ul class="text-gray-700 mb-6">
          <li>
            Phone: <a href="tel:270-885-0074" class="text-blue-500 hover:underline">270-885-0074</a>
          </li>
          <li>
            Toll-Free:
            <a href="tel:1-800-733-PLAY" class="text-blue-500 hover:underline">1-800-733-PLAY</a>
          </li>
          <li>
            Email:
            <a href="mailto:academy@shopmusiccentral.com" class="text-blue-500 hover:underline">
              academy@shopmusiccentral.com
            </a>
          </li>
        </ul>

        <h3 class="text-xl font-semibold text-gray-800 mb-2">Make a Payment</h3>
        <p class="text-gray-700 mb-6">
          If you’re an existing student or a parent of a student and need to make a lesson payment, please click below.
          <strong>Note:</strong>
          This is the updated payment site, so it may look different from what you’re used to!
        </p>
        <a
          href={~p"/user/dashboard"}
          class="inline-block bg-red-700 text-white font-semibold py-2 px-4 rounded-lg hover:bg-red-800"
        >
          Access My Account
        </a>
      </div>
    </div>
    """
  end
end
