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


## Setting up X Server for WSL (kept here for reference)

The X Server
Download and install VcXsrv (https://sourceforge.net/projects/vcxsrv/) in Windows. Once installed, run xlaunch.exe (from the VcXsrv folder in Program Files). You can leave most of the settings as default, but make sure to check “Disable access control”. Allow it through the firewall if prompted when you first run it.

In Linux the DISPLAY environment variable tells GUI applications at which IP address the X Server is that we want to use. Since in WSL2 the IP address of Windows land is not localhost anymore, we need to set DISPLAY to the correct IP address:

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
I recommend you put this in your .bashrc or whatever the equivalent is for your distro.

Now if you run echo $DISPLAY you should get something like 172.17.35.177:0.0.

All done
If you run google-chrome the Linux-side Chrome should open inside an X server window in Windows! This will also “just work” when ChromeDriver tries to open Chrome when you run your automated tests.



Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
