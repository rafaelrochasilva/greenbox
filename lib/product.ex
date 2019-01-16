defmodule Greenbox.Product do
  defstruct [:id, :name, :price]

  def price_to_money(price) do
    "$#{price / 100}"
  end

  def capitalize_name(name) do
    name
    |> String.downcase()
    |> String.capitalize()
  end
end
