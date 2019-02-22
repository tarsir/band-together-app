defmodule BandTogetherAppWeb.UserController do
  use BandTogetherAppWeb, :controller

  alias BandTogetherApp.Musicians
  alias BandTogetherApp.Musicians.User

  action_fallback BandTogetherAppWeb.FallbackController

  def index(conn, _params) do
    users = Musicians.list_users()
    render(conn, "index.json", users: users)
  end

  def new(conn, _) do
    changeset = Musicians.change_user(%User{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Musicians.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Musicians.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Musicians.get_user!(id)

    with {:ok, %User{} = user} <- Musicians.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Musicians.get_user!(id)
    with {:ok, %User{}} <- Musicians.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
