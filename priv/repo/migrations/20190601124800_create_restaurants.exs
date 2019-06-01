defmodule CustomType.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    execute("CREATE TYPE locationz AS ( latitude float, longitude float );")

    create table(:restaurants) do
      add :name, :string
      add :location, :locationz, null: false

      timestamps()
    end

  end
end
