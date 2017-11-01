defmodule BandTogetherAppWeb.TalentController do
  use BandTogetherAppWeb, :controller

  alias BandTogetherApp.Musicians
  alias BandTogetherApp.Musicians.Talent

  action_fallback BandTogetherAppWeb.FallbackController

  def index(conn, _params) do
    talents = Musicians.list_talents()
    render(conn, "index.json", talents: talents)
  end

  def create(conn, %{"talent" => talent_params}) do
    with {:ok, %Talent{} = talent} <- Musicians.create_talent(talent_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", talent_path(conn, :show, talent))
      |> render("show.json", talent: talent)
    end
  end

  def show(conn, %{"id" => id}) do
    talent = Musicians.get_talent!(id)
    render(conn, "show.json", talent: talent)
  end

  def update(conn, %{"id" => id, "talent" => talent_params}) do
    talent = Musicians.get_talent!(id)

    with {:ok, %Talent{} = talent} <- Musicians.update_talent(talent, talent_params) do
      render(conn, "show.json", talent: talent)
    end
  end

  def delete(conn, %{"id" => id}) do
    talent = Musicians.get_talent!(id)
    with {:ok, %Talent{}} <- Musicians.delete_talent(talent) do
      send_resp(conn, :no_content, "")
    end
  end
end
