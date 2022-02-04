defmodule ChatterWeb.ChatRoomChannel  do
  use Phoenix.Channel
  require Logger

  def join("chat_room:" <> _room_name, _msg, socket) do
    {:ok, socket}
  end

  def handle_in("new_message", payload, socket) do
    broadcast(socket, "new_message", payload)
    {:noreply, socket}
  end

end
