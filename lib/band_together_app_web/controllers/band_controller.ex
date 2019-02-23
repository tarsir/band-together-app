defmodule BandTogetherAppWeb.BandController do
  use BandTogetherAppWeb, :controller

  alias BandTogetherApp.Musicians
  alias BandTogetherApp.Musicians.Band

  action_fallback BandTogetherAppWeb.FallbackController

  def index(conn, _params) do
    bands = Musicians.list_bands()
    render(conn, :index, bands: bands)
  end

  def create(conn, %{"band" => band_params}) do
    with {:ok, %Band{} = band} <- Musicians.create_band(band_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", band_path(conn, :show, band))
      |> render("show.json", band: band)
    end
  end

  def show(conn, %{"id" => id}) do
    band = Musicians.get_band!(id)
    render(conn, "show.json", band: band)
  end

  def update(conn, %{"id" => id, "band" => band_params}) do
    band = Musicians.get_band!(id)

    with {:ok, %Band{} = band} <- Musicians.update_band(band, band_params) do
      render(conn, "show.json", band: band)
    end
  end

  def delete(conn, %{"id" => id}) do
    band = Musicians.get_band!(id)
    with {:ok, %Band{}} <- Musicians.delete_band(band) do
      send_resp(conn, :no_content, "")
    end
  end
end
