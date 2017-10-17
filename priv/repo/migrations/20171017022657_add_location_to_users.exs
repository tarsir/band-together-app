defmodule BandTogetherApp.Repo.Migrations.AddLocationToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :loc_country, :string
      add :loc_state, :string
      add :loc_city, :string
    end
  end
end
