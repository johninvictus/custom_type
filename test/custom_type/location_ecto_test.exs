defmodule CustomType.Location.EctoTest do
  @moduledoc """
  This module will contain all test belonging to `CustomType.Location.Ecto`
  """
  use CustomType.DataCase
  alias CustomType.Location

  describe "location_ecto" do
    @location_map {44.968046, -94.420307}

    test "cast function}" do
      assert {:ok, %Location{} = location} = Location.Ecto.cast(@location_map)
      assert {:ok, %Location{}} = Location.Ecto.cast(location)
      assert Location.Ecto.cast("location") == :error
    end
  end
end
