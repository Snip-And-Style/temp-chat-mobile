import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.textTheme.headlineLarge,
        ),
        SizedBox(height: 8.h),
        Text(
          subTitle,
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
