import 'package:snip_and_style/assembly/entity/user/user_from_dto.dart';
import 'package:snip_and_style/assembly/factory.dart';
import 'package:snip_and_style/assembly/model/user/user_dto_from_json.dart';
import 'package:snip_and_style/data/model/room/room_dto.dart';
import 'package:snip_and_style/domain/entity/room/room.dart';

class RoomFromDto implements Factory<Room, RoomDto> {
  RoomFromDto(this._userFromDto);

  final UserFromDto _userFromDto;

  @override
  Room create(RoomDto dto) {
    return Room(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      isPrivate: dto.isPrivate,
      password: dto.password,
      capacity: dto.capacity,
      lifeTime: dto.lifeTime,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      users: dto.users.map(_userFromDto.create).toList(),
    );
  }
}
