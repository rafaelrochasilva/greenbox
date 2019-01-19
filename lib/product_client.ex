defmodule Greenbox.ProductClient do
  def fetch_products do
    response = url() |> HTTPoison.get!()
    Poison.decode!(response.body)
  end

  defp url do
    Application.get_env(:greenbox, :abc_products_url)
  end
end
