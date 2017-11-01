defmodule BandTogetherAppWeb.MonitoringController do
  use BandTogetherAppWeb, :controller

  action_fallback BandTogetherAppWeb.FallbackController

  def health_check(conn, _params) do
    conn |> send_resp(200, "")
  end
end