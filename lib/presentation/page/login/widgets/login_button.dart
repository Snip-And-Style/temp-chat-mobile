import 'package:flutter/material.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.submit,
  });

  final void Function() submit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: submit,
      child: Container(
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff374ACB),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: context.color.surface,
              // blurRadius: 16,
              offset: const Offset(-16, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.signIn,
              style: context.textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
