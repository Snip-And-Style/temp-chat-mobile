import 'package:snip_and_style/domain/entity/room/room.dart';

abstract class RoomService {
  Future<List<Room>> getRooms();
}
