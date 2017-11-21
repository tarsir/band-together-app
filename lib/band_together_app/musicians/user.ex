defmodule BandTogetherApp.Musicians.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandTogetherApp.Musicians.User
  alias BandTogetherApp.Musicians.Talent
  alias BandTogetherApp.Musicians.Band
  alias BandTogetherApp.Musicians.Portfolio


  schema "users" do
    field :biography, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :stage_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :loc_country, :string
    field :loc_state, :string
    field :loc_city, :string

    timestamps()
    many_to_many :bands, Band, join_through: "bands_users"
    many_to_many :talents, Talent, join_through: "users_talents"
    many_to_many :portfolios, Portfolio, join_through: "users_portfolios"
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password, :biography, :stage_name, :loc_country, :loc_state, :loc_city])
    |> validate_required([:first_name, :last_name, :email, :biography])
    |> unique_constraint(:email)
    |> put_password_hash
  end

  def registration_changeset(model, params \\ :empty) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_length(:password, min: 6)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
