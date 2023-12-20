import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';
import 'package:snip_and_style/config/gen/assets.gen.dart';

import 'package:snip_and_style/config/router/app_route.dart';
import 'package:snip_and_style/presentation/page/login/bloc/login_bloc.dart';
import 'package:snip_and_style/presentation/page/register/register_form.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            SvgPicture.asset(
              Assets.images.authAdventure.path,
            ),
            Center(
              child: Text(
                l10n.loginToAccount,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            _buildAnimatedregisterForm(),
            TextButton(
              onPressed: () {
                context.router.push(const LoginRoute());
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: l10n.doNotHaveAccount,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: l10n.signUp,
                      style: const TextStyle(
                        color: Color(0xFF6C63FF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedregisterForm() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: 1,
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: const AlwaysStoppedAnimation<double>(1),
            curve: Curves.easeInOut,
          ),
        ),
        child: const RegisterForm(),
      ),
    );
  }
}
