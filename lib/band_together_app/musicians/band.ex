defmodule BandTogetherApp.Musicians.Band do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandTogetherApp.Musicians.Band
  alias BandTogetherApp.Musicians.User


  schema "bands" do
    field :biography, :string
    field :description, :string
    field :loc_city, :string
    field :loc_country, :string
    field :loc_state, :string
    field :stage_name, :string

    timestamps()
    many_to_many :users, User, join_through: "bands_users"
  end

  @doc false
  def changeset(%Band{} = band, attrs) do
    band
    |> cast(attrs, [:stage_name, :description, :biography, :loc_country, :loc_city, :loc_state])
    |> validate_required([:stage_name, :description, :biography])
  end
end
