import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snip_and_style/domain/entity/user/user.dart';

part 'room.freezed.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required int id,
    required String name,
    required String description,
    required String createdAt,
    required String updatedAt,
    required List<User> users,
    String? password,
    int? capacity,
    bool? isPrivate,
    int? lifeTime,
  }) = _Room;
}
