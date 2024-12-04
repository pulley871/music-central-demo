defmodule MusicCentralWeb.DashboardLive.Index do
  alias MusicCentral.Messages
  alias MusicCentral.Events
  use MusicCentralWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(page_title: "Dashboard")
      |> assign(:lessons, nil)
      |> assign(:messages, nil)

    if connected?(socket) do
      Process.send_after(self(), :fetch_lessons, 2000)
      Process.send_after(self(), :fetch_messages, 3000)
    end

    # send(self(), :fetch_lessons)
    # |> assign(:lessons, format_lessons())

    IO.inspect(socket)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="mt-6">
      <h1 class="text-center text-2xl font-bold text-red-800">Account Overview</h1>
      <div class="mt-8 flex flex-col md:flex-row gap-8 md:justify-center">
        <%= if @lessons do %>
          <.upcoming_lessons lessons={@lessons} />
        <% else %>
          <.list_skeleton title="Upcoming Lessons" />
        <% end %>
        <%= if @messages do %>
          <.messages messages={@messages} />
        <% else %>
          <.list_skeleton title="Messages" />
        <% end %>
        <%!-- <.messages /> --%>
      </div>
    </div>
    """
  end

  attr :lessons, :list, default: []

  def upcoming_lessons(assigns) do
    ~H"""
    <div class="bg-black rounded-lg px-6 py-2 max-w-full md:max-w-96 md:min-w-96 md:min-h-72">
      <h1 class="text-center font-extrabold text-xl text-white">Upcoming Lessons</h1>
      <ul class="mt-6">
        <%= for lesson <- @lessons do %>
          <li class="flex justify-between">
            <div class="flex justify-between w-full">
              <div class="flex flex-col">
                <p class="font-semibold text-white">
                  <%= "#{String.capitalize(lesson.title)}" %>
                </p>
                <p class="font-semibold text-white text-sm"><%= lesson.formatted_date %></p>
              </div>
              <div class="flex items-center">
                <p class="font-semibold text-white"><%= "#{String.capitalize(lesson.sub_type)}" %></p>
              </div>
            </div>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end

  attr :messages, :list, default: []

  def messages(assigns) do
    ~H"""
    <div class="border-2 border-dashed border-red-900 rounded-lg px-6 py-2 max-w-full md:max-w-96 md:min-w-96 md:min-h-72">
      <h1 class="text-center text-xl text-red-800 font-extrabold">Messages</h1>
      <ul class="mt-6">
        <%= for message <- @messages do %>
          <li class="flex justify-between">
            <div>
              <p><%= message.message %></p>
              <p><%= message.read %></p>
            </div>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end

  def handle_info(:fetch_lessons, socket) do
    {:noreply, assign(socket, :lessons, format_lessons())}
  end

  def handle_info(:fetch_messages, socket) do
    {:noreply, assign(socket, :messages, fetch_messages(socket))}
  end

  defp format_lessons() do
    current_week = Date.utc_today() |> Date.beginning_of_week(:monday)

    lessons =
      Events.list_week_events(Timex.to_datetime(current_week))

    Enum.map(lessons, fn lesson ->
      formatted_date =
        case Timex.format(lesson.scheduled_at, "{0M}-{0D}-{YYYY} {h12}:{0m} {AM}") do
          {:ok, date} -> date
          {:error, _reason} -> "Invalid Date"
        end

      Map.put(lesson, :formatted_date, formatted_date)
    end)
  end

  defp fetch_messages(socket) do
    Messages.list_messages_by_user(socket.assigns.current_user)
  end
end
