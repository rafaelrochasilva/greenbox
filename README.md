# Greenbox

Greenbox is an online store that sells natural organic beauty products, where
users can choose a diffent variaty of products and mount its own box.

We have a stock that changes its prices every 10 minutes, due to our crazy
promotions. The app, check the prices every 10 minutes, to keep the products name and
price updated.

# How to:
Enter inside iex
`iex -S mix`

Run the code
```
{:ok, pid} = Greenbox.PriceUpdater.start_link()
Greenbox.PriceUpdater.list_products(pid)
```
