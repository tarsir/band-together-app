defmodule BandTogetherAppWeb.SessionController do
  require Logger
  use BandTogetherAppWeb, :controller

  alias BandTogetherApp.Authentication.Session
  alias BandTogetherApp.Musicians.User
  alias BandTogetherApp.Repo

  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  action_fallback BandTogetherAppWeb.FallbackController

  def create(conn, %{"email" => email, "password" => password}) do
    user = Repo.get_by(User, email: email)
    cond do
      user && checkpw(password, user.password_hash) ->
        session_changeset = Session.create_changeset(%Session{}, %{user_id: user.id})
        {:ok, session} = Repo.insert(session_changeset)
        conn
        |> put_status(:created)
        |> render("show.json", session: session, user: user)
      user ->
        conn
        |> put_status(:unauthorized)
        |> render("error.json")
      true ->
        dummy_checkpw()
        conn
        |> put_status(:unauthorized)
        |> render("error.json")
    end
  end

  def current_user(conn, %{"sessionToken" => token, "userId" => user_id}) do
    session = Repo.get_by(Session, token: token)
    if session.user_id == user_id do
      render(conn, "session_user.json", session: session, user: Repo.get(User, user_id))
    else
      conn
      |> put_status(:error)
      |> render("error.json")
    end
  end

  def delete(conn, %{"token" => token}) do
    session = Repo.get_by(Session, token: token)
    with {:ok, %Session{}} <- Authentication.delete_session(session) do
      send_resp(conn, :no_content, "")
    end
  end
end
