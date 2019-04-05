defmodule BandTogetherApp.Musicians.PortfolioTags do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandTogetherApp.Musicians.PortfolioTags

  @primary_key false
  schema "portfolios_tags" do
    belongs_to :portfolio, BandTogetherApp.Musicians.Portfolio
    belongs_to :tag, BandTogetherApp.Musicians.Tag
    timestamps()
  end

  @doc false
  def changeset(%PortfolioTags{} = struct, attrs) do
    struct
    |> cast(attrs, [:portfolio_id, :tag_id])
    |> validate_required([:portfolio_id, :tag_id])
  end
end

