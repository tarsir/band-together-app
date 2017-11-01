defmodule BandTogetherApp.Repo.Migrations.CreateUsersTalents do
  use Ecto.Migration

  def change do
    create table(:users_talents) do
      add :user_id, references(:users)
      add :talent_id, references(:talents)
    end

    create unique_index(:users_talents, [:user_id, :talent_id])
  end
end
