import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snip_and_style/backbone/dependency_injection.dart';
import 'package:snip_and_style/backbone/extensions/build_context_extension.dart';
import 'package:snip_and_style/domain/entity/room/room.dart';
import 'package:snip_and_style/presentation/page/messages/bloc/messages_bloc.dart';
import 'package:snip_and_style/presentation/page/messages/widgets/room_container.dart';

@RoutePage()
class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final MessagesBloc _messagesBloc = getIt.get<MessagesBloc>();

  @override
  void initState() {
    _messagesBloc.add(const MessagesEvent.getInitialData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.add,
            size: 24.h,
            color: context.color.primary,
          ),
          onPressed: () {
            context.router.pop();
          },
        ),
        title: Text(
          'Messages',
          style: context.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 24.h,
              color: context.color.primary,
            ),
            onPressed: () {},
          ),
        ],
        backgroundColor: context.color.background,
      ),
      body: BlocSelector<MessagesBloc, MessagesState, List<Room>?>(
        bloc: _messagesBloc,
        selector: (state) {
          return state.when(
            loading: () => null,
            success: (rooms) => rooms,
          );
        },
        builder: (context, state) {
          if (state == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final rooms = state;
            return Expanded(
              child: ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, number) {
                  return const RoomContainer();
                },
              ),
            );
          }
        },
      ),
    );
  }
}
