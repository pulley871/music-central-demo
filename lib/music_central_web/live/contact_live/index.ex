defmodule MusicCentralWeb.ContactLive.Index do
  alias MusicCentral.Contact
  use MusicCentralWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1 class="mb-6">Contact us</h1>
    <.form
      for={@form}
      phx-change="validate"
      phx-submit="submit"
      id="contact-form"
      class="flex flex-col gap-6"
    >
      <.input
        field={@form[:email]}
        placeholder="Enter your email..."
        autocomplete="off"
        label="Email"
      />
      <.input field={@form[:subject]} placeholder="Subject" autocomplete="off" label="Subject" />
      <.input
        field={@form[:message]}
        placeholder="Whats on your mind?"
        autocomplete="off"
        label="Message"
        type="textarea"
      />
      <.button class="md:w-fit" type="submit">Submit</.button>
    </.form>
    """
  end

  def mount(_params, _session, socket) do
    changeset = Contact.changeset(%Contact{}, %{})

    socket =
      socket
      |> assign(form: to_form(changeset))

    {:ok, socket}
  end

  # Explicit pattern matching for both validate and submit events
  def handle_event("validate", %{"contact" => params}, socket) do
    form =
      %Contact{}
      |> Contact.changeset(params)
      |> to_form(action: :validate)

    {:noreply, assign(socket, form: form)}
  end

  def handle_event("submit", %{"contact" => params}, socket) do
    case Contact.create(params) do
      {:ok, _result} ->
        {:noreply,
         socket
         |> put_flash(:info, "Message sent successfully!")
         |> push_navigate(to: ~p"/")}

      {:error, changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
