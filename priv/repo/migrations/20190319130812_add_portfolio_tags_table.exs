defmodule BandTogetherApp.Repo.Migrations.AddPortfolioTagsTable do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :tag_name, :string

      timestamps()
    end

    create table(:portfolios_tags) do
      add :portfolio_id, references(:portfolios)
      add :tag_id, references(:tags)

      timestamps()
    end

    create unique_index(:tags, :tag_name)
    create unique_index(:portfolios_tags, [:portfolio_id, :tag_id])
  end
end
