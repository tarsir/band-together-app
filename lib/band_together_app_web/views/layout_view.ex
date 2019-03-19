defmodule BandTogetherAppWeb.LayoutView do
  use BandTogetherAppWeb, :view
  import BandTogetherApp.Authentication

  def current_user_name(conn) do
    case current_user(conn) do
      {:ok, user} ->
        user.stage_name
      {:error, err} ->
        nil
    end
  end
end
