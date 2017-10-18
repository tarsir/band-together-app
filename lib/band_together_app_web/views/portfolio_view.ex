defmodule BandTogetherAppWeb.PortfolioView do
  use BandTogetherAppWeb, :view
  alias BandTogetherAppWeb.PortfolioView

  def render("index.json", %{portfolios: portfolios}) do
    %{data: render_many(portfolios, PortfolioView, "portfolio.json")}
  end

  def render("show.json", %{portfolio: portfolio}) do
    %{data: render_one(portfolio, PortfolioView, "portfolio.json")}
  end

  def render("portfolio.json", %{portfolio: portfolio}) do
    %{id: portfolio.id,
      title: portfolio.title,
      url: portfolio.url}
  end
end
