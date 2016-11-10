defmodule FrontDesk.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :email, :string
      add :handle, :string
      add :phone, :string
      add :crypted_password, :string

      timestamps()
    end
    create unique_index(:players, [:email])
    create unique_index(:players, [:handle])
    create unique_index(:players, [:phone])

  end
end
