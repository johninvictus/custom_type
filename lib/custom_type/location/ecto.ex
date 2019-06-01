if Code.ensure_loaded?(Ecto.Type) do
  defmodule CustomType.Ecto do
    @moduledoc """
    This is the file that will interact with the `Ecto.Schema`
    And return the appropriate values
    """

    alias CustomType.Location

    # Defines functions and the Ecto.Type behaviour for implementing custom types.
    @behaviour Ecto.Type

    # This represents the name of the type created inside the frist migration file
    ## ie.
    # execute("""
    # CREATE TYPE location AS (
    # latitude float
    # longitude float
    # );
    # """)

    # You can also use type used in `Ecto.Migration` like :string, :float, ..etc

    def type, do: :location

    @doc """
    This functions takes a value and converts it to your desired Ecto custom type
    """
    def cast(%Location{} = location), do: {:ok, location}

    def cast({lat, long}), do: {:ok, %Location{latitude: lat, longitude: long}}

    def cast(_), do: :error
  end
end
