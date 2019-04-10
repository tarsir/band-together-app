defmodule BandTogetherAppWeb.UserController do
  use BandTogetherAppWeb, :controller

  alias BandTogetherApp.Musicians
  alias BandTogetherApp.Musicians.User

  action_fallback BandTogetherAppWeb.FallbackController

  def index(conn, _params) do
    users = Musicians.list_users()
    render(conn, :index, users: users)
  end

  def new(conn, _) do
    changeset = Musicians.change_user(%User{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Musicians.create_user(user_params) do
      conn
      |> put_status(:created)
      |> render(:show, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Musicians.get_user!(id)
    render(conn, :show, user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Musicians.get_user!(id)

    with {:ok, %User{} = user} <- Musicians.update_user(user, user_params) do
      render(conn, :show, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Musicians.get_user!(id)
    with {:ok, %User{}} <- Musicians.delete_user(user) do
      render(conn, :index)
    end
  end
end
