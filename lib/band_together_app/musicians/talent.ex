defmodule BandTogetherApp.Musicians.Talent do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandTogetherApp.Musicians.Talent


  schema "talents" do
    field :img_filepath, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Talent{} = talent, attrs) do
    talent
    |> cast(attrs, [:title, :img_filepath])
    |> validate_required([:title, :img_filepath])
  end
end
