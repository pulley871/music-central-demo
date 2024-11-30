defmodule MusicCentral.EventsTest do
  use MusicCentral.DataCase

  alias MusicCentral.Events

  describe "events" do
    alias MusicCentral.Events.Event

    import MusicCentral.EventsFixtures

    @invalid_attrs %{type: nil, title: nil, sub_type: nil, scheduled_at: nil, completed: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{type: "some type", title: "some title", sub_type: "some sub_type", scheduled_at: ~D[2024-11-15], completed: true}

      assert {:ok, %Event{} = event} = Events.create_event(valid_attrs)
      assert event.type == "some type"
      assert event.title == "some title"
      assert event.sub_type == "some sub_type"
      assert event.scheduled_at == ~D[2024-11-15]
      assert event.completed == true
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{type: "some updated type", title: "some updated title", sub_type: "some updated sub_type", scheduled_at: ~D[2024-11-16], completed: false}

      assert {:ok, %Event{} = event} = Events.update_event(event, update_attrs)
      assert event.type == "some updated type"
      assert event.title == "some updated title"
      assert event.sub_type == "some updated sub_type"
      assert event.scheduled_at == ~D[2024-11-16]
      assert event.completed == false
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
