defmodule BandTogetherApp.Authentication.Session do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandTogetherApp.Authentication.Session


  schema "sessions" do
    field :token, :string
    belongs_to :user_id, BandTogetherApp.Musicians.User

    timestamps()
  end

  @required_fields ~w(user_id)

  @doc false
  def changeset(%Session{} = session, attrs) do
    session
    |> cast(attrs, [:token])
    |> cast_assoc(:user_id)
  end

  def create_changeset(%Session{} = session, attrs) do
    session
    |> changeset(attrs)
    |> put_change(:token, SecureRandom.urlsafe_base64())
  end
end
