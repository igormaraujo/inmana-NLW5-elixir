defmodule Inmana.RestaurantTest do
  use Inmana.DataCase, async: true

  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Restaurant 01", email: "restaurant01@mail.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{name: "Restaurant 01", email: "restaurant01@mail.com"},
               valid?: true
             } = response
    end

    test "when are invalid params, returns an invalid changeset" do
      params = %{name: "R", email: ""}

      expected_response = %{
        email: ["can't be blank"],
        name: ["should be at least 2 character(s)"]
      }

      response = Restaurant.changeset(params)

      assert %Changeset{valid?: false} = response

      assert errors_on(response) == expected_response
    end
  end
end
