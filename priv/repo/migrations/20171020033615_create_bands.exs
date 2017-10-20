defmodule BandTogetherApp.Repo.Migrations.CreateBands do
  use Ecto.Migration

  def change do
    create table(:bands) do
      add :stage_name, :string
      add :description, :string
      add :biography, :string
      add :loc_country, :string
      add :loc_city, :string
      add :loc_state, :string

      timestamps()
    end

  end
end
