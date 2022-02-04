# Features

- Home page test (smoke test)
- Show a list of chat room (todo)
- Refactoring our feature test
  - chat_room/index.html.eex
    - prefer data-attributes to css class for testing feature
    - change test to business term rather than technical term
    - extract Query.data to a meaningful function
    - improve test body to match the description
    - remove redundant code from room.ex (as we don't need now.  Later we will add it as needed as per requirement)
- Creating Rooms
  - User story: As a user, I want to visit the chat room index page and create a chat room by name
    - Create an outside test
    - Create an inside model test
    - Create a test for validation of name presence and uniqueness

  - Show room

- As a user, I can join a chat room, so that I can have a conversation with another user.


