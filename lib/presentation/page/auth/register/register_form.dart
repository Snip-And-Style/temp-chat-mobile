import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snip_and_style/backbone/dependency_injection.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';
import 'package:snip_and_style/config/gen/assets.gen.dart';
import 'package:snip_and_style/config/router/app_route.dart';
import 'package:snip_and_style/presentation/page/auth/login/bloc/login_bloc.dart';
import 'package:snip_and_style/presentation/page/auth/widgets/auth_button.dart';
import 'package:snip_and_style/presentation/page/auth/widgets/auth_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  //Input controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //Form key
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

  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: getIt.get<LoginBloc>(),
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          success: () {
            context.router.push(const HomeRoute());
          },
          failure: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error)),
            );
          },
        );
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Username TextFormField
                AuthField(
                  controller: _usernameController,
                  labelText: l10n.username,
                  icon: SvgPicture.asset(Assets.images.user.path),
                ),
                const SizedBox(height: 30),
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
                  icon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                    child: SvgPicture.asset(
                      _hidePassword
                          ? Assets.images.eye.path
                          : Assets.images.eyeOff.path,
                    ),
                  ),
                  obscureText: _hidePassword,
                ),
                const SizedBox(height: 30),
                //Terms and Conditions
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall, // Default text style
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'By checking the box you agree to our '),
                            TextSpan(
                              text: 'Terms',
                              style: const TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Code to open Terms
                                },
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Conditions',
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
                ),
                const SizedBox(height: 30),
                // Login Button with AnimatedContainer
                LoginButton(
                  submit: _submit,
                  buttonText: l10n.signUp,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        );
      },
    );
  }
}
