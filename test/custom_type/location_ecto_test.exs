defmodule CustomType.Location.EctoTest do
  @moduledoc """
  This module will contain all test belonging to `CustomType.Location.Ecto`
  """
  use CustomType.DataCase
  alias CustomType.Location

  describe "location_ecto" do
    @location_map {44.968046, -94.420307}

    test "cast function" do
      assert {:ok, %Location{} = location} = Location.Ecto.cast(@location_map)
      assert {:ok, %Location{}} = Location.Ecto.cast(location)
      assert Location.Ecto.cast("location") == :error
    end

    test "dump function" do
      {:ok, loc} = Location.Ecto.cast(@location_map)
      assert Location.Ecto.dump(loc) == {:ok, @location_map}
      assert Location.Ecto.dump("wrong data") == :error
    end
  end

  test "load function" do
    assert Location.Ecto.load(@location_map) == Location.Ecto.cast(@location_map)
    assert Location.Ecto.load("Invalid") == :error
  end

  test "type in schema" do
  end
end
