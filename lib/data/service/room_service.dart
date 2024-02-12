import 'package:snip_and_style/assembly/entity/room/room_from_dto.dart';
import 'package:snip_and_style/domain/entity/room/room.dart';
import 'package:snip_and_style/domain/gateway/room_gateway.dart';
import 'package:snip_and_style/domain/service/room_service.dart';

class RoomServiceImpl implements RoomService {
  RoomServiceImpl(
    this._roomGateway,
    this._roomFromDto,
  );

  final RoomGateway _roomGateway;
  final RoomFromDto _roomFromDto;

  @override
  Future<List<Room>> getRooms() {
    return _roomGateway
        .getRooms()
        .then((value) => value.map(_roomFromDto.create).toList());
  }
}
