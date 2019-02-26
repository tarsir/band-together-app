defmodule BandTogetherAppWeb.SessionController do
  require Logger
  use BandTogetherAppWeb, :controller

  alias BandTogetherApp.Authentication.Session
  alias BandTogetherApp.Musicians.User
  alias BandTogetherApp.Repo

  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  action_fallback BandTogetherAppWeb.FallbackController

  # HTML response methods

  def new(conn, %{"redirect_target" => redirect_target}) do
    conn 
    |> put_flash(:info, "You must be signed in to access this page.")
    |> render("new.html", login: %{}, redirect: redirect_target)
  end

  def new(conn, _) do
    render(conn, "new.html", login: %{}, redirect: "")
  end

  def create(conn, %{"login" => %{"email" => email, "password" => password}}) do
    user = Repo.get_by(User, email: email)
    cond do
      user && checkpw(password, user.password_hash) ->
        session_changeset = Session.create_changeset(%Session{}, %{user_id: user.id})
        {:ok, session} = Repo.insert(session_changeset)
        conn
        |> put_flash(:info, "Welcome back, " <> user.stage_name)
        |> Plug.Conn.put_session(:session_token, session.token)
        |> redirect(to: page_path(conn, :index))
      user ->
        conn
        |> put_flash(:error, "We couldn't sign you in, so double-check your email and password!")
        |> render(:new, login: %{})
      true ->
        dummy_checkpw()
        conn
        |> put_flash(:error, "We couldn't sign you in, so double-check your email and password!")
        |> render(:new, login: %{})
    end
  end

  # JSON response methods

  # not yet ready, needs to use current user to get session token
  def logout(conn, _) do
    # session = Repo.get_by(Session, token: token)
    # with {:ok, %Session{}} <- Authentication.delete_session(session) do
    #   send_resp(conn, :no_content, "")
    # end
  end
end
