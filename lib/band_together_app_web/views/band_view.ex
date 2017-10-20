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
      location: %{
        country: band.loc_country,
        city: band.loc_city,
        state: band.loc_state
      }
    }
  end
end
