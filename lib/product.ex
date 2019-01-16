defmodule Greenbox.Product do
  defstruct [:id, :name, :price]

  @doc """
  Converts price in cents to a string money format.

  ## Example:
    iex> Greenbox.Product.price_to_money(1245)
    "$12.45"

  """
  def price_to_money(price) do
    "$#{price / 100}"
  end

  @doc """
  Capitalize the product name.

  ## Example:
    iex> Greenbox.Product.capitalize_name("My PRODUCT")
    "My product"

  """
  def capitalize_name(name) do
    name
    |> String.downcase()
    |> String.capitalize()
  end
end
