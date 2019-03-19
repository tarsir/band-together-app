defmodule BandTogetherApp.Musicians.Tag do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tags" do

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [])
    |> validate_required([])
  end
end
