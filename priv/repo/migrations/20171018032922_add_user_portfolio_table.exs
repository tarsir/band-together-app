defmodule BandTogetherApp.Repo.Migrations.AddUserPortfolioTable do
  use Ecto.Migration

  def change do
    create table(:users_portfolios) do
      add :user_id, references(:users)
      add :portfolio_id, references(:portfolios)
    end

    create unique_index(:users_portfolios, [:user_id, :portfolio_id])
  end
end