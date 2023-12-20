import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snip_and_style/backbone/dependency_injection.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';

import 'package:snip_and_style/presentation/page/login/bloc/login_bloc.dart';
import 'package:snip_and_style/presentation/page/login/widgets/auth_field.dart';

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

  //Form validation
  bool _validate() {
    return _formKey.currentState!.validate();
  }

  //Form submission
  void _submit() {
    if (_validate()) {
      // context.read<RegisterCubit>().register(
      //       username: _usernameController.text,
      //       email: _emailController.text,
      //       password: _passwordController.text,
      //     );
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
          success: () {
            // Navigation logic here, e.g.:
            // context.router.replace(const HomeRoute());
          },
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
                    // Username TextFormField
                    AuthField(
                      controller: _usernameController,
                      labelText: l10n.username,
                      icon: SvgPicture.asset('assets/images/mail.svg'),
                    ),
                    const SizedBox(height: 16),
                    // Email TextFormField
                    AuthField(
                      controller: _emailController,
                      labelText: l10n.email,
                      icon: SvgPicture.asset('assets/images/mail.svg'),
                    ),
                    const SizedBox(height: 16),
                    // Password TextFormField
                    AuthField(
                      controller: _passwordController,
                      labelText: l10n.password,
                      icon: SvgPicture.asset('assets/images/mail.svg'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    // Login Button with AnimatedContainer
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 50,
                      width: state.maybeWhen(
                        loading: () => 50.0, // Width when in loading state
                        orElse: () => 200.0, // Width for other states
                      ),
                      child: ElevatedButton(
                        onPressed: state.maybeWhen(
                          loading: null,
                          orElse: () => _submit,
                        ),
                        child: state.maybeWhen(
                          loading: () => const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          orElse: () => Text(
                            l10n.login,
                            style: const TextStyle(
                              color: Color(0xFF6C63FF),
                            ),
                          ), // Text for other states
                        ),
                      ),
                    ),
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
