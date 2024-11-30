defmodule MusicCentralWeb.HomeLive.Index do
  use MusicCentralWeb, :live_view

  def mount(_params, _session, socket) do
    MusicCentralWeb.Endpoint.subscribe("dashboard")
    {:ok, socket}
  end

  def handle_info(msg, socket) do
    IO.inspect(msg)

    socket =
      socket
      |> put_flash(:info, msg.payload)

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <section class="flex flex-col items-center justify-center h-screen bg-gray-50 text-center px-6">
        <div class="max-w-4xl mx-auto">
          <h1 class="text-4xl sm:text-6xl font-bold mb-6">
            Welcome to <span class="text-red-700">Music Central</span>
          </h1>
          <p class="text-lg sm:text-xl mb-8">
            Your destination for top-quality music equipment, instruments, lessons, and AV installations.
          </p>
          <a
            href="#services"
            class="bg-red-700 text-white px-6 py-3 rounded-lg font-semibold text-lg hover:bg-red-800 transition duration-300"
          >
            Explore Our Services
          </a>
        </div>
      </section>
      <!-- Services Section -->
      <section id="services" class="py-16 px-5 bg-white rounded-xl">
        <div class="max-w-5xl mx-auto text-center">
          <h2 class="text-3xl font-bold mb-8">What We Offer</h2>
          <div class="grid gap-10 sm:grid-cols-2 md:grid-cols-3">
            <!-- Service 1: Music Equipment -->
            <div class="bg-gray-50 shadow-lg rounded-lg p-6">
              <img
                src="/images/music_equipment.png"
                alt="Music Equipment"
                class="h-32 w-auto mx-auto mb-4"
              />
              <h3 class="text-xl font-semibold mb-2">Music Equipment</h3>
              <p>High-quality gear and instruments to enhance every musician’s experience.</p>
            </div>
            <!-- Service 2: Band Instruments -->
            <div class="bg-gray-50 shadow-lg rounded-lg p-6">
              <img
                src="/images/band_instruments.png"
                alt="Band Instruments"
                class="h-32 w-auto mx-auto mb-4"
              />
              <h3 class="text-xl font-semibold mb-2">Band Instruments</h3>
              <p>A full range of band instruments for students, schools, and professionals alike.</p>
            </div>
            <!-- Service 3: Lessons -->
            <div class="bg-gray-50 shadow-lg rounded-lg p-6">
              <img src="/images/lessons.png" alt="Lessons" class="h-32 w-auto mx-auto mb-4" />
              <h3 class="text-xl font-semibold mb-2">Lessons</h3>
              <p>Personalized music lessons with experienced instructors for all ages.</p>
            </div>
            <!-- Service 4: AV Installations -->
            <div class="bg-gray-50 shadow-lg rounded-lg p-6">
              <img
                src="/images/av_installations.png"
                alt="AV Installations"
                class="h-32 w-auto mx-auto mb-4"
              />
              <h3 class="text-xl font-semibold mb-2">AV Installations</h3>
              <p>Professional audio-visual setups for venues, schools, and events.</p>
            </div>
            <!-- Service 5: Financing Options -->
            <div class="bg-gray-50 shadow-lg rounded-lg p-6">
              <img
                src="/images/financing.png"
                alt="Financing Options"
                class="h-32 w-auto mx-auto mb-4"
              />
              <h3 class="text-xl font-semibold mb-2">Financing Options</h3>
              <p>Flexible financing plans to help you bring home the gear you need.</p>
            </div>
            <!-- Service 6: In-Store Support -->
            <div class="bg-gray-50 shadow-lg rounded-lg p-6">
              <img src="/images/support.png" alt="In-Store Support" class="h-32 w-auto mx-auto mb-4" />
              <h3 class="text-xl font-semibold mb-2">In-Store Support</h3>
              <p>
                Knowledgeable staff ready to assist you with every aspect of your musical journey.
              </p>
            </div>
          </div>
        </div>
      </section>
      <!-- Call to Action Section -->
      <section class="py-16 bg-gray-50 text-center">
        <h2 class="text-3xl font-bold mb-6">Ready to Start Your Musical Journey?</h2>
        <p class="text-lg mb-8">
          Visit us at Music Central to experience the best in musical gear, lessons, and more.
        </p>
        <a
          href={~p"/contact-us"}
          class="bg-red-700 text-white px-8 py-4 rounded-lg font-semibold text-lg hover:bg-red-800 transition duration-300"
        >
          Contact Us Today
        </a>
      </section>
    </div>
    """
  end
end
