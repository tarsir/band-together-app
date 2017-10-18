defmodule BandTogetherApp.Musicians.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandTogetherApp.Musicians.User


  schema "users" do
    field :biography, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :stage_name, :string
    field :password, :string
    field :loc_country, :string
    field :loc_state, :string
    field :loc_city, :string

    timestamps()
    many_to_many :talents, BandTogetherApp.Musicians.Talent, join_through: "users_talents"
    many_to_many :portfolios, BandTogetherApp.Musicians.Portfolio, join_through: "users_portfolios"
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password, :biography, :stage_name, :loc_country, :loc_state, :loc_city])
    |> validate_required([:first_name, :last_name, :email, :biography])
    |> unique_constraint(:email)
  end
end
