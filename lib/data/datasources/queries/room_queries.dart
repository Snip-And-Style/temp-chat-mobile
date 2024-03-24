class RoomQueries {
  static const String getRooms = '''
    query Room {
      rooms {
        id
        name
        description
        isPrivate
        password
        capacity
        createdAt
        updatedAt
        Users {
          id
          name
          email
          socket
          createdAt
          updatedAt
        }
      }
    }
  ''';
}
