defmodule Greenbox.ProductFetcher do
  alias Greenbox.Product

  def build() do
    fetch_products()
    |> proccess_products()
  end

  defp proccess_products(products) do
    Enum.map(products, fn %{id: id, name: name, price: price} ->
      %Product{
        id: id,
        name: Product.capitalize_name(name),
        price: Product.price_to_money(price)
      }
    end)
  end

  defp fetch_products do
    [
      %{id: "1234", name: "BLUE OCEAN CREAM", price: Enum.random(8000..10000)},
      %{id: "1235", name: "SEA SOAP", price: Enum.random(5000..60000)}
    ]
  end
end
