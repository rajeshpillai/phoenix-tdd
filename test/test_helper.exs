ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Chatter.Repo, :manual)

# Start Wallaby
{:ok, _} = Application.ensure_all_started(:wallaby)

# Basse URL
Application.put_env(:wallaby, :base_url, ChatterWeb.Endpoint.url())
