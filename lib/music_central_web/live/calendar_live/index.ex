defmodule MusicCentralWeb.CalendarLive.Index do
  alias MusicCentral.Events
  use MusicCentralWeb, :live_view

  def mount(params, session, socket) do
    current_week = Date.utc_today() |> Date.beginning_of_week(:monday)
    time_blocks = time_blocks()

    events =
      Events.list_week_events(Timex.to_datetime(current_week))
      |> events_by_time_block()

    IO.inspect(events)

    {:ok,
     assign(socket,
       current_week: current_week,
       time_blocks: time_blocks,
       # Initialize events as an empty map
       events: events
     )}
  end

  def render(assigns) do
    ~H"""
    <div class="calendar">
      <.back navigate={~p"/user/dashboard"} class="hover:text-red-600">Dashboard</.back>
      <!-- Header: Days of the week -->
      <div class="calendar-header grid grid-cols-7 gap-2">
        <!-- Empty Top-Left Cell -->
        <div></div>
        <%= for day <- days_of_week(@current_week) do %>
          <div class="day-column text-center font-semibold">
            <%= day %>
          </div>
        <% end %>
      </div>
      <!-- Time Blocks -->
      <div class="calendar-body">
        <%= for {time, label} <- @time_blocks do %>
          <div class="time-row grid grid-cols-7 gap-2">
            <div class="time-label text-right font-medium">
              <%= label %>
            </div>

            <%= for day <- days_of_week(@current_week) do %>
              <div class="event-cell p-2 h-12 border rounded-md relative hover:bg-blue-100">
                <!-- Check if there are any events at this specific day and time -->
                <%= for event <- Map.get(@events, "#{day} #{time}", []) do %>
                  <span class="event-icon absolute top-0 left-0 right-0 bottom-0 flex justify-center items-center">
                    <%= event.type %>
                    <!-- Display event type or icon -->
                  </span>
                <% end %>
              </div>
            <% end %>
          </div>
        <% end %>
      </div>
      <!-- Navigation -->
      <div class="calendar-nav mt-4 flex justify-between">
        <button phx-click="prev_week" class="px-4 py-2 bg-blue-500 text-white rounded-md">
          Previous
        </button>
        <button phx-click="next_week" class="px-4 py-2 bg-blue-500 text-white rounded-md">
          Next
        </button>
      </div>
    </div>
    """
  end

  defp time_blocks do
    Enum.flat_map(10..17, fn hour ->
      [
        {Time.new!(hour, 0, 0), format_time(hour, 0)},
        {Time.new!(hour, 30, 0), format_time(hour, 30)}
      ]
    end)
  end

  defp format_time(hour, minute) do
    # Convert to 12-hour format and add AM/PM
    formatted_hour = if hour > 12, do: hour - 12, else: hour
    period = if hour >= 12, do: "PM", else: "AM"
    "#{formatted_hour}:#{pad(minute)} #{period}"
  end

  defp pad(number) when number < 10, do: "0#{number}"
  defp pad(number), do: "#{number}"

  defp days_of_week(week_start) do
    Enum.map(0..5, fn n ->
      day_date = Timex.shift(week_start, days: n)
      # Get the full date string (e.g., "2024-11-15")
      Timex.format!(day_date, "{YYYY}-{0M}-{0D}")
    end)
  end

  defp events_by_time_block(events) do
    Enum.reduce(events, %{}, fn event, acc ->
      date_key = Date.to_string(DateTime.to_date(event.scheduled_at))
      time_key = Time.to_string(Time.new!(event.scheduled_at.hour, event.scheduled_at.minute, 0))

      key = "#{date_key} #{time_key}"

      Map.update(acc, key, [event], &[event | &1])
    end)
  end
end
