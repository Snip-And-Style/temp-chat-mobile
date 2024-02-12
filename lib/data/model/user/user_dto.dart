import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required int id,
    required String name,
    required String email,
    required String createdAt,
    required String updatedAt,
    String? socket,
  }) = _UserDto;
}
