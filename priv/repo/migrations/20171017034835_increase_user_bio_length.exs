defmodule BandTogetherApp.Repo.Migrations.IncreaseUserBioLength do
  use Ecto.Migration

  def up do
    alter table(:users) do
      modify :biography, :text
    end
  end

  def down do
    alter table(:users) do
      modify :biography, :varchar, size: 255
    end
  end
end
