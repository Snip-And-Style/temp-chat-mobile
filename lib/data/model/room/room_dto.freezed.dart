// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoomDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  List<UserDto> get users => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  int? get capacity => throw _privateConstructorUsedError;
  bool? get isPrivate => throw _privateConstructorUsedError;
  int? get lifeTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomDtoCopyWith<RoomDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomDtoCopyWith<$Res> {
  factory $RoomDtoCopyWith(RoomDto value, $Res Function(RoomDto) then) =
      _$RoomDtoCopyWithImpl<$Res, RoomDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String createdAt,
      String updatedAt,
      List<UserDto> users,
      String? password,
      int? capacity,
      bool? isPrivate,
      int? lifeTime});
}

/// @nodoc
class _$RoomDtoCopyWithImpl<$Res, $Val extends RoomDto>
    implements $RoomDtoCopyWith<$Res> {
  _$RoomDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? users = null,
    Object? password = freezed,
    Object? capacity = freezed,
    Object? isPrivate = freezed,
    Object? lifeTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserDto>,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
      lifeTime: freezed == lifeTime
          ? _value.lifeTime
          : lifeTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomDtoImplCopyWith<$Res> implements $RoomDtoCopyWith<$Res> {
  factory _$$RoomDtoImplCopyWith(
          _$RoomDtoImpl value, $Res Function(_$RoomDtoImpl) then) =
      __$$RoomDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String description,
      String createdAt,
      String updatedAt,
      List<UserDto> users,
      String? password,
      int? capacity,
      bool? isPrivate,
      int? lifeTime});
}

/// @nodoc
class __$$RoomDtoImplCopyWithImpl<$Res>
    extends _$RoomDtoCopyWithImpl<$Res, _$RoomDtoImpl>
    implements _$$RoomDtoImplCopyWith<$Res> {
  __$$RoomDtoImplCopyWithImpl(
      _$RoomDtoImpl _value, $Res Function(_$RoomDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? users = null,
    Object? password = freezed,
    Object? capacity = freezed,
    Object? isPrivate = freezed,
    Object? lifeTime = freezed,
  }) {
    return _then(_$RoomDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserDto>,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrivate: freezed == isPrivate
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
      lifeTime: freezed == lifeTime
          ? _value.lifeTime
          : lifeTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$RoomDtoImpl implements _RoomDto {
  const _$RoomDtoImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      required final List<UserDto> users,
      this.password,
      this.capacity,
      this.isPrivate,
      this.lifeTime})
      : _users = users;

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  final List<UserDto> _users;
  @override
  List<UserDto> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final String? password;
  @override
  final int? capacity;
  @override
  final bool? isPrivate;
  @override
  final int? lifeTime;

  @override
  String toString() {
    return 'RoomDto(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, users: $users, password: $password, capacity: $capacity, isPrivate: $isPrivate, lifeTime: $lifeTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.isPrivate, isPrivate) ||
                other.isPrivate == isPrivate) &&
            (identical(other.lifeTime, lifeTime) ||
                other.lifeTime == lifeTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_users),
      password,
      capacity,
      isPrivate,
      lifeTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomDtoImplCopyWith<_$RoomDtoImpl> get copyWith =>
      __$$RoomDtoImplCopyWithImpl<_$RoomDtoImpl>(this, _$identity);
}

abstract class _RoomDto implements RoomDto {
  const factory _RoomDto(
      {required final int id,
      required final String name,
      required final String description,
      required final String createdAt,
      required final String updatedAt,
      required final List<UserDto> users,
      final String? password,
      final int? capacity,
      final bool? isPrivate,
      final int? lifeTime}) = _$RoomDtoImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  List<UserDto> get users;
  @override
  String? get password;
  @override
  int? get capacity;
  @override
  bool? get isPrivate;
  @override
  int? get lifeTime;
  @override
  @JsonKey(ignore: true)
  _$$RoomDtoImplCopyWith<_$RoomDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
