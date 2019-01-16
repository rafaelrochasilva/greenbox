defmodule Greenbox.PriceUpdater do
  use GenServer
  alias Greenbox.ProductFetcher

  # 10 seconds
  @time_to_consume 10000

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  @doc """
  Starts the Genserver to process the work, and scheadule the next time the
  work will be done again
  """
  def init(_) do
    state = ProductFetcher.build()
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
    products = ProductFetcher.build()

    schedule_work()
    {:noreply, products}
  end

  def handle_call(:list_products, _, state) do
    {:reply, state, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :get_products, @time_to_consume)
  end
end
