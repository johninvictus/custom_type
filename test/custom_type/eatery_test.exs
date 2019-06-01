defmodule CustomType.EateryTest do
  use CustomType.DataCase

  alias CustomType.Eatery

  describe "restaurants" do
    alias CustomType.Eatery.Restaurant

    @valid_attrs %{name: "some name", lat: 44.968046, long: -94.420307}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def restaurant_fixture(attrs \\ %{}) do
      {:ok, restaurant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Eatery.create_restaurant()

      %{restaurant | lat: nil, long: nil}
    end

    test "list_restaurants/0 returns all restaurants" do
      restaurant = restaurant_fixture()
      assert Eatery.list_restaurants() == [restaurant]
    end

    test "get_restaurant!/1 returns the restaurant with given id" do
      restaurant = restaurant_fixture()
      assert Eatery.get_restaurant!(restaurant.id) == restaurant
    end

    test "create_restaurant/1 with valid data creates a restaurant" do
      assert {:ok, %Restaurant{} = restaurant} = Eatery.create_restaurant(@valid_attrs)
      assert restaurant.name == "some name"
    end

    test "create_restaurant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Eatery.create_restaurant(@invalid_attrs)
    end

    test "update_restaurant/2 with valid data updates the restaurant" do
      restaurant = restaurant_fixture()

      assert {:ok, %Restaurant{} = restaurant} =
               Eatery.update_restaurant(restaurant, @update_attrs)

      assert restaurant.name == "some updated name"
    end

    test "update_restaurant/2 with invalid data returns error changeset" do
      restaurant = restaurant_fixture()
      assert {:error, %Ecto.Changeset{}} = Eatery.update_restaurant(restaurant, @invalid_attrs)
      assert restaurant == Eatery.get_restaurant!(restaurant.id)
    end

    test "delete_restaurant/1 deletes the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{}} = Eatery.delete_restaurant(restaurant)
      assert_raise Ecto.NoResultsError, fn -> Eatery.get_restaurant!(restaurant.id) end
    end

    test "change_restaurant/1 returns a restaurant changeset" do
      restaurant = restaurant_fixture()
      assert %Ecto.Changeset{} = Eatery.change_restaurant(restaurant)
    end
  end
end
