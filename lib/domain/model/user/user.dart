/*
id: Int!
name: String!
email: String!
socket: String
createdAt: String!
updatedAt: String!
*/

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required String socket,
    required String createdAt,
    required String updatedAt,
  }) = _User;
}
