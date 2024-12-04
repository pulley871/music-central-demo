defmodule MusicCentralWeb.AccountLessonsLive.Index do
  use MusicCentralWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, page_title: "Lessons")
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.back navigate={~p"/user/dashboard"} class="hover:text-red-600">Dashboard</.back>
      <h1>My lessons</h1>
    </div>
    """
  end
end
