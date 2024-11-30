defmodule MusicCentral.Contact do
  alias MusicCentral.Mailer
  use Ecto.Schema
  import Ecto.Changeset
  require EEx
  import Swoosh.Email

  embedded_schema do
    field :email, :string
    field :subject, :string
    field :message, :string
  end

  def changeset(contact_form, attrs) do
    contact_form
    |> cast(attrs, [:email, :subject, :message])
    |> validate_required([:email, :subject, :message], message: "This field is required")
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "Must be a valid email address")
    |> validate_length(:subject, min: 3, max: 100)
    |> validate_length(:message, min: 10, max: 1000)
  end

  def create(attrs) do
    changeset = changeset(%__MODULE__{}, attrs)

    if changeset.valid? do
      # Send email
      # Or from configuration
      recipient = changeset.changes[:email]
      subject = changeset.changes[:subject]
      body = changeset.changes[:message]

      case deliver(recipient, subject, body) do
        {:ok, _email} ->
          # Email sent successfully
          {:ok, changeset.changes}

        {:error, reason} ->
          # Handle email sending error
          {:error, %{changeset | errors: [email: {"Failed to send email", reason}]}}
      end
    else
      {:error, changeset}
    end
  end

  EEx.function_from_file(
    :def,
    :contact_email_template,
    "lib/music_central/email/templates/contact_email.html.heex",
    [:sender_email, :subject, :body]
  )

  defp deliver(recipient, subject, body) do
    email =
      new()
      |> to(recipient)
      |> from({"MusicCentral", "contact@example.com"})
      |> subject("We received your contact request")
      |> html_body(contact_email_template(recipient, subject, body))

    with {:ok, _metadata} <- Mailer.deliver(email) do
      {:ok, email}
    end
  end
end
