defmodule FrontDesk.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :start, :datetime
      add :end, :datetime
      add :location, :string
      add :player_id, references(:players, on_delete: :nothing)

      timestamps()
    end
    create index(:games, [:player_id])

  end
end
