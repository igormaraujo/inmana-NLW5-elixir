defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true

  import Phoenix.View

  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{name: "Restaurant 01", email: "restaurant01@mail.com"}
      {:ok, restaurant} = Inmana.create_restaurante(params)

      response = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant Created",
               restaurant: %Inmana.Restaurant{
                 email: "restaurant01@mail.com",
                 id: _id,
                 name: "Restaurant 01"
               }
             } = response
    end
  end
end
