if Code.ensure_loaded?(Ecto.Type) do
  defmodule CustomType.Location.Ecto do
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

    def type, do: :locationz

    @doc """
    This functions takes a value and converts it to your desired Ecto custom type
    """
    def cast(%Location{} = location), do: {:ok, location}

    def cast({lat, long}), do: {:ok, %Location{latitude: lat, longitude: long}}

    def cast(_), do: :error

    @doc """
     When loading data from the database, we are guaranteed to
     receive a map (as databases are strict) and we will
     just put the data back into an Location struct to be stored
     in the loaded schema struct.
    """
    def load({lat, long}) do
      {:ok, %Location{latitude: lat, longitude: long}}
    end

    def load(_), do: :error

    @doc """
    dump function, it convertes your custom type to map that can be stored to the database
    """
    def dump(%Location{latitude: lat, longitude: long}) do
      {:ok, {lat, long}}
    end

    def dump(_), do: :error
  end
end
