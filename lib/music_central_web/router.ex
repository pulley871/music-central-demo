defmodule MusicCentralWeb.Router do
  alias MusicCentralWeb.UserLoginLive
  use MusicCentralWeb, :router

  import MusicCentralWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {MusicCentralWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
    plug :spy
  end

  def spy(conn, _opts) do
    IO.inspect(conn)
    # IO.inspect(conn)

    conn
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MusicCentralWeb do
    pipe_through :browser

    live "/", HomeLive.Index
    live "/about", AboutLive.Index
    live "/lessons", LessonsLive.Index
    live "/rentals", RentalsLive.Index
    live "/store", StoreLive.Index
    live "/contact-us", ContactLive.Index
  end

  # Other scopes may use custom stacks.
  # scope "/api", MusicCentralWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:music_central, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MusicCentralWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", MusicCentralWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{MusicCentralWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/register", AuthLive.Create, :new
      live "/login", AuthLive.Index, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/login", UserSessionController, :create
  end

  scope "/", MusicCentralWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{MusicCentralWeb.UserAuth, :ensure_authenticated}] do
      live "/user/settings", UserSettingsLive, :edit
      live "/user/settings/confirm_email/:token", UserSettingsLive, :confirm_email
      live "/user/dashboard", DashboardLive.Index
      # live "/user/lessons", AccountLessonsLive.Index
      live "/user/lessons", CalendarLive.Index
    end
  end

  scope "/", MusicCentralWeb do
    pipe_through [:browser]

    delete "/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{MusicCentralWeb.UserAuth, :mount_current_user}] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
