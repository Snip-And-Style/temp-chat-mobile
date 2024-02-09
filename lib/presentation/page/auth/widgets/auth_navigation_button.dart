import 'package:flutter/material.dart';
import 'package:snip_and_style/backbone/extensions/build_context_extension.dart';

class AuthNavigationButton extends StatelessWidget {
  const AuthNavigationButton({
    required this.onPressed,
    required this.title,
    required this.subTitle,
    super.key,
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
