defmodule BandTogetherApp.Authentication.Session do
  require Logger
  use Ecto.Schema
  import Ecto.Changeset
  alias BandTogetherApp.Repo
  alias BandTogetherApp.Authentication.Session


  schema "sessions" do
    field :token, :string
    belongs_to :user, BandTogetherApp.Musicians.User, on_replace: :nilify 

    timestamps()
  end

  @required_fields ~w(user_id)

  @doc false
  def changeset(%Session{} = session, attrs) do
    session
    |> cast(attrs, [:token, :user_id])
    |> cast_assoc(:user)
  end

  def create_changeset(%Session{} = session, attrs) do
    session
    |> changeset(attrs)
    |> put_change(:token, SecureRandom.urlsafe_base64())
  end
end
