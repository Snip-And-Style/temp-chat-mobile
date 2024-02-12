import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snip_and_style/domain/model/user/user.dart';

part 'room.freezed.dart';

@freezed
class Room with _$Room {
  /*
  id: Int!
name: String!
description: String!
isPrivate: Boolean!
password: String
capacity: Int!
lifeTime: Int!
createdAt: String!
updatedAt: String!
Messages: [Message]
Users: [User]
*/

  const factory Room({
    required int id,
    required String name,
    required String description,
    required bool isPrivate,
    required String password,
    required int capacity,
    required int lifeTime,
    required String createdAt,
    required String updatedAt,
    required List<User> users,
  }) = _Room;
}
