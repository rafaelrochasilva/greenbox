defmodule Greenbox.ProductTest do
  use ExUnit.Case, async: true
  doctest Greenbox.Product
  alias Greenbox.Product

  describe "Given a product" do
    test "transforms its name by captilizing it" do
      # Setup
      product_name = "BLUE SOAP"

      # Exercise
      expected_product_name = Product.capitalize_name(product_name)

      # Verify
      assert expected_product_name == "Blue soap"
    end

    test "transforms the price in cents to dollar" do
      # Setup
      product_price_in_cents = 1253

      # Exercise
      expected_product_name = Product.price_to_money(product_price_in_cents)

      # Verify
      assert expected_product_name == "$12.53"
    end
  end
end
