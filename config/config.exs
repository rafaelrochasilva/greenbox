use Mix.Config

# Uses the FakeClient also for dev and prod since this abc_products_client
# does not exists.
# config :greenbox,
#   abc_products_client: Greenbox.ProductClient,
#   abc_products_url: "http://abcproducts.com/products"
config :greenbox,
  abc_products_client: Greenbox.FakeClient
