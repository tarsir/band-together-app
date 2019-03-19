defmodule BandTogetherAppWeb.PageController do
  use BandTogetherAppWeb, :controller

  def index(conn, _) do
    render conn, :index
  end

  def about(conn, _) do
    render conn, :about
  end
end
