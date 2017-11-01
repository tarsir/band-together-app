defmodule BandTogetherApp.Repo.Migrations.AddBandUsersTable do
  use Ecto.Migration

  def change do
    create table(:bands_users) do
      add :user_id, references(:users)
      add :band_id, references(:bands)
    end

    create unique_index(:bands_users, [:user_id, :band_id])
  end
end
