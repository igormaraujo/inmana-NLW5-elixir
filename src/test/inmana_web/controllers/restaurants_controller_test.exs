defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{name: "Restaurant 01", email: "restaurant01@mail.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant Created",
               "restaurant" => %{
                 "email" => "restaurant01@mail.com",
                 "id" => _id,
                 "name" => "Restaurant 01"
               }
             } = response
    end
  end
end
