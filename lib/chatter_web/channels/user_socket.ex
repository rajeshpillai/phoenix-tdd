defmodule ChatterWeb.UserSocket do
  use Phoenix.Socket

  channel "chat_room:*", ChatterWeb.ChatRoomChannel

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil

end
