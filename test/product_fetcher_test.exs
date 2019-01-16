defmodule Greenbox.ProductFetcherTest do
  use ExUnit.Case, async: true
  alias Greenbox.ProductFetcher

  describe "Given a request to fetch a list of products" do
    test "builds a list of products with id, capitalized name and price in dollar" do
      products = ProductFetcher.build()
      assert [
        %{id: "1234", name: "Blue ocean cream", price: _},
        %{id: "1235", name: "Sea soap", price: _}
      ] = products
    end

    test "builds a product with the price with dollar sign" do
      product =
        ProductFetcher.build()
        |> List.first()

      assert Regex.match?(~r/\$\d+\.\d+/, product.price)
    end
  end
end
