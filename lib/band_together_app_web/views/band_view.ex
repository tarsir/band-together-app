defmodule BandTogetherAppWeb.BandView do
  use BandTogetherAppWeb, :view
  alias BandTogetherAppWeb.BandView

  def render("index.json", %{bands: bands}) do
    %{data: render_many(bands, BandView, "band.json")}
  end

  def render("show.json", %{band: band}) do
    %{data: render_one(band, BandView, "band.json")}
  end

  def render("band.json", %{band: band}) do
    %{id: band.id,
      stage_name: band.stage_name,
      description: band.description,
      biography: band.biography,
      loc_country: band.loc_country,
      loc_city: band.loc_city,
      loc_state: band.loc_state}
  end
end
