defmodule CustomType.Eatery.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias CustomType.Location

  schema "restaurants" do
    field :name, :string
    field :location, Location.Ecto
    field :lat, :float, virtual: true
    field :long, :float, virtual: true
    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [:name, :lat, :long])
    |> validate_required([:name, :lat, :long])
    |> put_location()
  end

  defp put_location(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: change} ->
        changeset
        |> put_change(
          :location,
          %Location{latitude: change.lat, longitude: change.long}
        )

      _ ->
        changeset
    end
  end
end
