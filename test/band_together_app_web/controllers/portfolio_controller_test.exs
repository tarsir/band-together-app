defmodule BandTogetherAppWeb.PortfolioControllerTest do
  use BandTogetherAppWeb.ConnCase

  alias BandTogetherApp.Musicians
  alias BandTogetherApp.Musicians.Portfolio

  @create_attrs %{title: "some title", url: "some url"}
  @update_attrs %{title: "some updated title", url: "some updated url"}
  @invalid_attrs %{title: nil, url: nil}

  def fixture(:portfolio) do
    {:ok, portfolio} = Musicians.create_portfolio(@create_attrs)
    portfolio
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all portfolios", %{conn: conn} do
      conn = get conn, portfolio_path(conn, :index)
    end
  end

  describe "create portfolio" do
    test "renders portfolio when data is valid", %{conn: conn} do
      conn = post conn, portfolio_path(conn, :create), portfolio: @create_attrs
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, portfolio_path(conn, :create), portfolio: @invalid_attrs
    end
  end

  describe "update portfolio" do
    setup [:create_portfolio]

    test "renders portfolio when data is valid", %{conn: conn, portfolio: %Portfolio{id: id} = portfolio} do
      conn = put conn, portfolio_path(conn, :update, portfolio), portfolio: @update_attrs
    end

    test "renders errors when data is invalid", %{conn: conn, portfolio: portfolio} do
      conn = put conn, portfolio_path(conn, :update, portfolio), portfolio: @invalid_attrs
    end
  end

  describe "delete portfolio" do
    setup [:create_portfolio]

    test "deletes chosen portfolio", %{conn: conn, portfolio: portfolio} do
      conn = delete conn, portfolio_path(conn, :delete, portfolio)
    end
  end

  defp create_portfolio(_) do
    portfolio = fixture(:portfolio)
    {:ok, portfolio: portfolio}
  end
end
