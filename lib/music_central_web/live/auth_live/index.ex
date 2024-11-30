defmodule MusicCentralWeb.AuthLive.Index do
  use MusicCentralWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <.header class="text-center">
        Log in to account
        <:subtitle>
          Don't have an account?
          <.link navigate={~p"/register"} class="font-semibold text-red-600 hover:underline">
            Sign up
          </.link>
          for an account now.
        </:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="login_form"
        action={~p"/login"}
        phx-update="ignore"
        class="bg-gray-50"
      >
        <.input field={@form[:email]} type="email" label="Email" required />
        <.input field={@form[:password]} type="password" label="Password" required />

        <:actions>
          <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
          <.link href={~p"/reset_password"} class="text-sm font-semibold hover:text-red-700">
            Forgot your password?
          </.link>
        </:actions>
        <:actions>
          <.button phx-disable-with="Logging in..." class="w-full bg-red-800 hover:bg-red-900">
            Log in <span aria-hidden="true">→</span>
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = Phoenix.Flash.get(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
