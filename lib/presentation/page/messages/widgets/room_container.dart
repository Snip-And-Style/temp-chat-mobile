import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snip_and_style/backbone/extensions/build_context_extension.dart';

// RoomContainer is a custom widget that displays room information
// including an avatar, user name, status, message, and notification count.
class RoomContainer extends StatelessWidget {
  const RoomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // Using ScreenUtil for responsive design.
    final avatarSize = 50.h;
    final spacing = 20.w; // Standard horizontal spacing.
    const imageUrl =
        'https://www.befunky.com/images/prismic/5ddfea42-7377-4bef-9ac4-f3bd407d52ab_landing-photo-to-cartoon-img5.jpeg?auto=avif,webp&format=jpg&width=863';

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 16.w,
      ),
      child: Row(
        children: [
          // User avatar container.
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(
                8.h,
              ),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
              height: avatarSize,
              width: avatarSize,
            ),
          ),
          SizedBox(width: spacing),
          // User information and message section.
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User name and status.
                Row(
                  children: [
                    Text(
                      'John Borino',
                      style: context.textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                        width: 8.w), // Small spacing between name and status.
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 4.h,
                    ),
                    const Spacer(),
                    Text(
                      'disappeared 12:40',
                      style: context.textTheme.bodySmall!.copyWith(
                        color: context.color.tertiary,
                      ),
                    ),
                  ],
                ),
                // Last message and unread message count.
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'How are you today?',
                        style: context.textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                        6.w,
                      ), // Padding inside notification count circle.
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.color.primary,
                      ),
                      child: Text(
                        '5',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.h,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
