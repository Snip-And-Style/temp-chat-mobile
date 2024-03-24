import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:snip_and_style/data/model/user/user_dto.dart';

part 'room_dto.freezed.dart';

@freezed
class RoomDto with _$RoomDto {
  const factory RoomDto({
    required int id,
    required String name,
    required String description,
    required String createdAt,
    required String updatedAt,
    required List<UserDto> users,
    String? password,
    int? capacity,
    bool? isPrivate,
    int? lifeTime,
  }) = _RoomDto;
}
