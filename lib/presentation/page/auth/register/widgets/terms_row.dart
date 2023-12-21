import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';

class TermsRow extends StatelessWidget {
  final bool isAgreed;
  final void Function(bool?) onChanged;
  const TermsRow({
    required this.isAgreed,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isAgreed,
          checkColor: context.color.background,
          onChanged: onChanged,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: RichText(
            text: TextSpan(
              style:
                  Theme.of(context).textTheme.bodySmall, // Default text style
              children: <TextSpan>[
                TextSpan(
                  text: context.l10n.checkAndAgree,
                ),
                TextSpan(
                  text: context.l10n.terms,
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Code to open Terms
                    },
                ),
                TextSpan(
                  text: context.l10n.and,
                ),
                TextSpan(
                  text: context.l10n.conditions,
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Code to open Conditions
                    },
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
