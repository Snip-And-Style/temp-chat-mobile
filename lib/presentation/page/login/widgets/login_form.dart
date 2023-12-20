import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snip_and_style/backbone/dependency_injection.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';
import 'package:snip_and_style/config/gen/assets.gen.dart';
import 'package:snip_and_style/presentation/page/login/bloc/login_bloc.dart';
import 'package:snip_and_style/presentation/page/login/widgets/auth_field.dart';
import 'package:snip_and_style/presentation/page/login/widgets/google_button.dart';
import 'package:snip_and_style/presentation/page/login/widgets/login_button.dart';
import 'package:snip_and_style/presentation/page/login/widgets/login_divider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Input controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Form validation
  bool _validate() {
    return _formKey.currentState!.validate();
  }

  // Form submission
  void _submit() {
    if (_validate()) {
      getIt.get<LoginBloc>().add(
            LoginEvent.login(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: getIt.get<LoginBloc>(),
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          success: () {},
          failure: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error)),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          orElse: () {
            // Default UI for states other than 'loading'
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Email TextFormField
                    AuthField(
                      controller: _emailController,
                      labelText: l10n.email,
                      icon: SvgPicture.asset(Assets.images.mail.path),
                    ),
                    const SizedBox(height: 30),
                    // Password TextFormField
                    AuthField(
                      controller: _passwordController,
                      labelText: l10n.password,
                      icon: SvgPicture.asset(Assets.images.eyeOff.path),
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    // Login Button with AnimatedContainer
                    LoginButton(
                      submit: _submit,
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        l10n.forgotPassword,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.color.outlineVariant,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 30),
                    const LoginDivider(),
                    const GoogleButton(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
