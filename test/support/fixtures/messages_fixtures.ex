defmodule MusicCentral.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MusicCentral.Messages` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        message: "some message",
        read: true
      })
      |> MusicCentral.Messages.create_message()

    message
  end
end
