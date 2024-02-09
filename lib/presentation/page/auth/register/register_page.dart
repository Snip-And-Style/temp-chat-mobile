import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';
import 'package:snip_and_style/config/router/app_route.dart';
import 'package:snip_and_style/presentation/page/auth/register/widgets/register_form.dart';
import 'package:snip_and_style/presentation/page/auth/widgets/auth_header.dart';
import 'package:snip_and_style/presentation/page/auth/widgets/auth_navigation_button.dart';

final _verticalPadding = 50.h;
final _horizontalPadding = 24.w;

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                title: context.l10n.getStarted,
                subTitle: context.l10n.getStartedFrom,
              ),
              const RegisterForm(),
              const Spacer(),
              AuthNavigationButton(
                onPressed: () => context.router.replace(const LoginRoute()),
                title: context.l10n.alreadyMember,
                subTitle: context.l10n.logInHere,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
