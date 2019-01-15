defmodule GreenBox.PriceUpdater do
  use GenServer

  @time_to_consume 10000 # 10 seconds

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  @doc """
  Starts the Genserver to process the work, and scheadule the next time the
  work will be done again
  """
  def init(_) do
    state = build_products()
    schedule_work()
    {:ok, state}
  end

  def list_products(pid) do
    GenServer.call(pid, :list_products)
  end

  @doc """
  Run the job and resquedule it to run again after some time.
  """
  def handle_info(:get_products, _state) do
    products = build_products()

    schedule_work()
    {:noreply, products}
  end

  def handle_call(:list_products, _, state) do
    {:reply, state, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :get_products, @time_to_consume)
  end



  defp build_products() do
    fetch_products()
    |> proccess_products
  end

  defp proccess_products(products) do
    Enum.map(products, fn %{id: id, name: name, price: price} ->
      new_name = name |> String.downcase() |> String.capitalize()
      new_price = "$#{price/100}"
      %{
        id: id,
        name: new_name,
        price: new_price
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
