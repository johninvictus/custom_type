defmodule CustomType.Eatery.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias CustomType.Location
  alias CustomType.Eatery.Restaurant

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

  def update_changeset(restaurant, attrs) do
    restaurant
    |> prepare_update()
    |> changeset(attrs)
  end

  @doc """
  Prevent nil lat and long values, error when updating
  """
  def prepare_update(
        %Restaurant{location: %Location{latitude: latitude, longitude: longitude}} = restaurant
      ) do
    %{restaurant | lat: latitude, long: longitude}
  end

  defp put_location(changeset) do
    if(changeset.valid?) do
      data = changeset |> apply_changes()

      changeset
      |> put_change(:location, %Location{latitude: data.lat, longitude: data.long})
    else
      changeset
    end
  end
end
