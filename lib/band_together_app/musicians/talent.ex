defmodule BandTogetherApp.Musicians.Talent do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandTogetherApp.Musicians.Talent


  schema "talents" do
    field :description, :string
    field :img_filepath, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Talent{} = talent, attrs) do
    talent
    |> cast(attrs, [:title, :description, :img_filepath])
    |> validate_required([:title, :description, :img_filepath])
  end
end
