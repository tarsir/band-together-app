defmodule BandTogetherAppWeb.UserView do
  use BandTogetherAppWeb, :view
  alias BandTogetherAppWeb.{UserView, TalentView}

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user_detail.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      stage_name: user.stage_name,
      email: user.email
    }
  end

  def render("user_detail.json", %{user: user}) do
    %{
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      stage_name: user.stage_name,
      email: user.email,
      biography: user.biography,
      talents: render_many(user.talents, TalentView, "talent.json"),
      location: %{
        country: user.loc_country,
        state: user.loc_state,
        city: user.loc_city
      }
    }
  end
end
