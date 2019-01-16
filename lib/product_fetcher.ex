defmodule Greenbox.ProductFetcher do
  alias Greenbox.Product

  def build() do
    client = get_client()

    client.fetch_products()
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

  defp get_client do
    Application.get_env(:greenbox, :abc_products_client)
  end
end
