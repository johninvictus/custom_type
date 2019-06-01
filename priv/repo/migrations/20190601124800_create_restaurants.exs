defmodule CustomType.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    execute("CREATE TYPE location AS ( latitude float, longitude float );")

    create table(:restaurants) do
      add :name, :string
      add :location, :location, null: false

      timestamps()
    end

  end
end
