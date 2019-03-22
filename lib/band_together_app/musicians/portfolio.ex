defmodule BandTogetherApp.Musicians.Portfolio do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandTogetherApp.Musicians.Portfolio


  schema "portfolios" do
    field :title, :string
    field :url, :string

    timestamps()
    many_to_many :users, BandTogetherApp.Musicians.User, join_through: "users_portfolios"
    many_to_many :tags, BandTogetherApp.Musicians.Tag, join_through: "portfolios_tags"
  end

  @doc false
  def changeset(%Portfolio{} = portfolio, attrs) do
    portfolio
    |> cast(attrs, [:title, :url])
    |> validate_required([:title, :url])
  end
end
