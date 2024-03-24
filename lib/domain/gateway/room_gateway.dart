import 'package:snip_and_style/data/model/room/room_dto.dart';
import 'package:snip_and_style/domain/entity/room/room.dart';

abstract class RoomGateway {
  Future<List<RoomDto>> getRooms();
}
