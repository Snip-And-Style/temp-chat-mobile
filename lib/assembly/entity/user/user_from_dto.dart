import 'package:snip_and_style/assembly/factory.dart';
import 'package:snip_and_style/data/model/user/user_dto.dart';
import 'package:snip_and_style/domain/entity/user/user.dart';

class UserFromDto implements Factory<User, UserDto> {
  @override
  User create(UserDto dto) {
    return User(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      socket: dto.socket,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
