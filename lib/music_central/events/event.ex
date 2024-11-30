defmodule MusicCentral.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :type, :string
    field :title, :string
    field :sub_type, :string
    field :scheduled_at, :utc_datetime
    field :completed, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :type, :sub_type, :scheduled_at, :completed])
    |> validate_required([:title, :type, :sub_type, :scheduled_at, :completed])
  end
end
