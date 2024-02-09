import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snip_and_style/backbone/extensions/build_context_extension.dart';
import 'package:snip_and_style/backbone/router/app_route.dart';

import 'package:snip_and_style/presentation/page/auth/login/widgets/login_form.dart';
import 'package:snip_and_style/presentation/page/auth/widgets/auth_header.dart';
import 'package:snip_and_style/presentation/page/auth/widgets/auth_navigation_button.dart';

final _verticalPadding = 50.h;
final _horizontalPadding = 24.w;

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: _verticalPadding,
            horizontal: _horizontalPadding,
          ),
          child: Column(
            children: [
              AuthHeader(
                title: context.l10n.signIn,
                subTitle: context.l10n.pleaseSignIn,
              ),
              const LoginForm(),
              const Spacer(),
              AuthNavigationButton(
                onPressed: () => context.router.replace(const RegisterRoute()),
                title: context.l10n.newMember,
                subTitle: context.l10n.registerNow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
