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

    user1 = build(:user) |> set_password("password") |> insert()
    user2 = build(:user) |> set_password("password") |> insert()


    session1 =
      metadata
      |> new_session()
      |> visit(rooms_index())
      |> sign_in(as: user1)
      |> join_room(room.name)

      session2 =
      metadata
      |> new_session()
      |> visit(rooms_index())
      |> sign_in(as: user2)
      |> join_room(room.name)

    # a user sends a message
    session1
      |> add_message("Hi everyone")

    # second user sees message and respnds
    session2
      |> assert_has(message("Hi everyone"))
      |> add_message("Hi, welcome to #{room.name}")

    # Assert the first user received the message
    session1
    |> assert_has(message("Hi, welcome to #{room.name}"))

  end

  defp new_session(metadata) do
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    session
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
