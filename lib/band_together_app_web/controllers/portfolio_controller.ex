defmodule BandTogetherAppWeb.PortfolioController do
  use BandTogetherAppWeb, :controller

  alias BandTogetherApp.Musicians
  alias BandTogetherApp.Musicians.Portfolio

  action_fallback BandTogetherAppWeb.FallbackController

  def index(conn, _params) do
    portfolios = Musicians.list_portfolios()
    render(conn, "index.json", portfolios: portfolios)
  end

  def create(conn, %{"portfolio" => portfolio_params}) do
    with {:ok, %Portfolio{} = portfolio} <- Musicians.create_portfolio(portfolio_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", portfolio_path(conn, :show, portfolio))
      |> render("show.json", portfolio: portfolio)
    end
  end

  def show(conn, %{"id" => id}) do
    portfolio = Musicians.get_portfolio!(id)
    render(conn, "show.json", portfolio: portfolio)
  end

  def update(conn, %{"id" => id, "portfolio" => portfolio_params}) do
    portfolio = Musicians.get_portfolio!(id)

    with {:ok, %Portfolio{} = portfolio} <- Musicians.update_portfolio(portfolio, portfolio_params) do
      render(conn, "show.json", portfolio: portfolio)
    end
  end

  def delete(conn, %{"id" => id}) do
    portfolio = Musicians.get_portfolio!(id)
    with {:ok, %Portfolio{}} <- Musicians.delete_portfolio(portfolio) do
      send_resp(conn, :no_content, "")
    end
  end
end
