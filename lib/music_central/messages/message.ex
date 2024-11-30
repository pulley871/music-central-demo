defmodule MusicCentral.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :message, :string
    field :read, :boolean, default: false

    belongs_to :sender, MusicCentral.Accounts.User, foreign_key: :sender_id
    belongs_to :receiver, MusicCentral.Accounts.User, foreign_key: :receiver_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:message, :read])
    |> validate_required([:message, :read])
  end
end
