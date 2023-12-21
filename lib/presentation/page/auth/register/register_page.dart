import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';

import 'package:snip_and_style/config/router/app_route.dart';
import 'package:snip_and_style/presentation/page/auth/register/widgets/register_form.dart';

const _verticalPadding = 50.0;
const _horizontalPadding = 24.0;
const _spaceHeight = 8.0;
const _animationDuration = Duration(milliseconds: 500);

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: _verticalPadding,
            horizontal: _horizontalPadding,
          ),
          child: Column(
            children: [
              _buildHeaderText(context),
              _buildAnimatedLoginForm(),
              // const Spacer(),
              // _buildTextButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.getStarted,
          style: context.textTheme.headlineLarge,
        ),
        const SizedBox(height: _spaceHeight),
        Text(
          context.l10n.getStartedFrom,
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildAnimatedLoginForm() {
    return const AnimatedOpacity(
      duration: _animationDuration,
      opacity: 1,
      child: RegisterForm(),
    );
  }

  Widget _buildTextButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.router.push(const RegisterRoute());
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: context.l10n.newMember,
              style: context.textTheme.bodyMedium,
            ),
            TextSpan(
              text: context.l10n.registerNow,
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
