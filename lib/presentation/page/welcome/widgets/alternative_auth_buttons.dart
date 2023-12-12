import 'package:flutter/material.dart';
import 'package:snip_and_style/config/l10n/l10n.dart';

class AlternativeAuthButtons extends StatelessWidget {
  const AlternativeAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 25,
          child: GestureDetector(
            child: Row(
              children: [
                const Icon(Icons.language),
                Text(context.l10n.signInWithGoogle),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 200,
          height: 25,
          child: GestureDetector(
            child: Row(
              children: [
                const Icon(Icons.language),
                Text(context.l10n.signInWithGitHub),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 200,
          height: 25,
          child: GestureDetector(
            child: Row(
              children: [
                const Icon(Icons.language),
                Text(context.l10n.signInWithoutRegistration),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
