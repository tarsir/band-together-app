defmodule BandTogetherApp.Repo.Migrations.RemoveDescriptionFromTalents do
  use Ecto.Migration

  def change do
    alter table(:talents) do
      remove(:description)
    end
  end
end
