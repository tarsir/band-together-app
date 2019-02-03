defmodule BandTogetherAppWeb.SessionView do
  use BandTogetherAppWeb, :view
  alias BandTogetherAppWeb.SessionView

  def render("show.json", %{session: session, user: user}) do
    %{
      user_id: session.user_id,
      token: session.token,
      current_user: user
    }
  end

  def render("session_user.json", %{session: session, user: user}) do
    %{
      user_id: session.user_id,
      token: session.token,
      current_user: user
    }
  end

  def render("error.json", _user_data) do
    %{errors: "User failed to authenticate"}
  end
end
