defmodule BandTogetherApp.Repo.Migrations.CreateTalents do
  use Ecto.Migration

  def change do
    create table(:talents) do
      add :title, :string
      add :description, :string
      add :img_filepath, :string

      timestamps()
    end

  end
end
