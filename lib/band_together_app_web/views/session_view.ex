defmodule BandTogetherAppWeb.SessionView do
  use BandTogetherAppWeb, :view
  alias BandTogetherAppWeb.SessionView

  def render("show.json", %{session: session}) do
    %{user_id: session.user_id,
      token: session.token}
  end

  def render("error.json", _user_data) do
    %{errors: "User failed to authenticate"}
  end
end
