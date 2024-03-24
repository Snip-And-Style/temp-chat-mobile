import 'package:snip_and_style/assembly/factory.dart';
import 'package:snip_and_style/data/model/user/user_dto.dart';

class UserDtoFromJson implements Factory<UserDto, Map<String, dynamic>> {
  @override
  UserDto create(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      socket: json['socket'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}
