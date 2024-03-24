import 'package:snip_and_style/assembly/factory.dart';
import 'package:snip_and_style/assembly/model/user/user_dto_from_json.dart';
import 'package:snip_and_style/data/model/room/room_dto.dart';

class RoomDtoFromJson implements Factory<RoomDto, Map<String, dynamic>> {
  RoomDtoFromJson(this._userDtoFromJson);
  final UserDtoFromJson _userDtoFromJson;

  @override
  RoomDto create(Map<String, dynamic> json) {
    return RoomDto(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      isPrivate: json['isPrivate'] as bool?,
      password: json['password'] as String?,
      capacity: json['capacity'] as int?,
      lifeTime: json['lifeTime'] as int?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      users: (json['Users'] as List)
          .map((e) => _userDtoFromJson.create(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
