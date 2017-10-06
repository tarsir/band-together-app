defmodule BandTogetherApp.Repo.Migrations.AddStageNameMusicianColumn do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :stage_name, :string
    end
  end
end
