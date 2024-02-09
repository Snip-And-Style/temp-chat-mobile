import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snip_and_style/backbone/dependency_injection.dart';
import 'package:snip_and_style/backbone/extensions/build_context_extension.dart';
import 'package:snip_and_style/backbone/gen/assets.gen.dart';
import 'package:snip_and_style/backbone/router/app_route.dart';
import 'package:snip_and_style/presentation/page/auth/register/bloc/register_bloc.dart';
import 'package:snip_and_style/presentation/page/auth/register/widgets/terms_row.dart';
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
    if (_validate() && _isAgreed) {
      getIt.get<RegisterBloc>().add(
            RegisterEvent.register(
              email: _emailController.text,
              password: _passwordController.text,
              username: _usernameController.text,
            ),
          );
    }
  }

  bool _hidePassword = true;
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: getIt.get<RegisterBloc>(),
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
                TermsRow(
                  isAgreed: _isAgreed,
                  onChanged: (value) {
                    setState(() {
                      _isAgreed = value!;
                    });
                  },
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
