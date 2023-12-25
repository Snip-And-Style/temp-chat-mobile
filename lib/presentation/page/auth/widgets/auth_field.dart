import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    required this.labelText,
    super.key,
    this.controller,
    this.icon,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String labelText;
  final Widget? icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Container(
          height: 60,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: controller,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              suffixIcon: icon,
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 24,
                maxWidth: 24,
              ),
              border: const UnderlineInputBorder(),
            ),
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
