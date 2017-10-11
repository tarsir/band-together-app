defmodule BandTogetherAppWeb.TalentView do
  use BandTogetherAppWeb, :view
  alias BandTogetherAppWeb.TalentView

  def render("index.json", %{talents: talents}) do
    %{data: render_many(talents, TalentView, "talent.json")}
  end

  def render("show.json", %{talent: talent}) do
    %{data: render_one(talent, TalentView, "talent.json")}
  end

  def render("talent.json", %{talent: talent}) do
    %{id: talent.id,
      title: talent.title,
      img_filepath: talent.img_filepath}
  end
end
