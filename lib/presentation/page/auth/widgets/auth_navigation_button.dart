import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';
import 'package:snip_and_style/config/router/app_route.dart';

class AuthNavigationButton extends StatelessWidget {
  const AuthNavigationButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.subTitle,
  });

  final void Function() onPressed;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title ',
              style: context.textTheme.bodyMedium,
            ),
            TextSpan(
              text: subTitle,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.color.outlineVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
