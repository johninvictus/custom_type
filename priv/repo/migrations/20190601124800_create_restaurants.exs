defmodule CustomType.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      add :name, :string

      timestamps()
    end

  end
end
