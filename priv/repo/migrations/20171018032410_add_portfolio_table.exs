defmodule BandTogetherApp.Repo.Migrations.AddPortfolioTable do
  use Ecto.Migration

  def change do
    create table(:portfolios) do
      add :title, :string
      add :url, :string

      timestamps()
    end

    create unique_index(:portfolios, [:title])
  end
end
