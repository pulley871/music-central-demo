defmodule MusicCentral.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MusicCentral.Events` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        completed: true,
        scheduled_at: ~D[2024-11-15],
        sub_type: "some sub_type",
        title: "some title",
        type: "some type"
      })
      |> MusicCentral.Events.create_event()

    event
  end
end
