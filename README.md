# Chatter

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Setup Google chrome in WSL
https://www.gregbrisebois.com/posts/chromedriver-in-wsl2/

To get chrome driver version follow below steps

- Get the chrome version from the browser help/about chrome menu option
- Note the version number and remove the last part
  - For e.g. if the version is 97.0.4692.99, removing last part gives 97.0.4692
  - Enter the extrated version in the below URL and you will get the driver version
      https://chromedriver.storage.googleapis.com/LATEST_RELEASE_97.0.4692.99

      For me the chrome driver version result is  97.0.4692.71




Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
