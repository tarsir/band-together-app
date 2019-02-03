defmodule BandTogetherAppWeb.PageController do
  use BandTogetherAppWeb, :controller

  def index(conn, _) do
    render conn, "index.html"
  end
end
