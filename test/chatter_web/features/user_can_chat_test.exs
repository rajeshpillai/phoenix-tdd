# Two users join the chat room
# Once they've joined, one user will send a message
# The second user will see the message and respond
# Finally, the first user will see the response

# Two users join the chat room
# To have two users in our test, we'll need to initiate
# two wallaby sessions. To do that, we need to make the
# metadata from ChatterWeb.FeatureCase available in our test. Let's do that before we write the test. Update the ChatterWeb.FeatureCase:

defmodule ChatterWeb.UserCanChatTest do
  use ChatterWeb.FeatureCase, async: true

  test "user can chat with others successfully", %{metadata: metadata} do
    room = insert(:chat_room)

    user =
      metadata
      |> new_user()
      |> visit(rooms_index())
      |> join_room(room.name)

    other_user =
      metadata
      |> new_user()
      |> visit(rooms_index())
      |> join_room(room.name)

    # a user sends a message
    user
      |> add_message("Hi everyone")

    # second user sees message and respnds
    other_user
      |> assert_has(message("Hi everyone"))
      |> add_message("Hi, welcome to #{room.name}")

    # Assert the first user received the message
    user
    |> assert_has(message("Hi, welcome to #{room.name}"))

  end

  defp new_user(metadata) do
    {:ok, user} = Wallaby.start_session(metadata: metadata)
    user
  end

  defp rooms_index, do: Routes.chat_room_path(@endpoint, :index)

  defp join_room(session, name) do
    session |> click(Query.link(name))
  end

  defp add_message(session, message) do
     session
    |> fill_in(Query.text_field("New Message"), with: message)
    |> click(Query.button("Send"))
 end

 defp message(text) do
  Query.data("role", "message", text: text)
 end

end
