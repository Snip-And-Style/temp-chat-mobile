import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snip_and_style/config/l10n/l10n.dart';
import 'package:snip_and_style/presentation/page/login/bloc/login_bloc.dart';
import 'package:snip_and_style/presentation/page/login/widgets/auth_field.dart';

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
      context.read<LoginBloc>().add(LoginEvent.login(
            email: _emailController.text,
            password: _passwordController.text,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<LoginBloc, LoginState>(
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
                    // Email TextFormField
                    AuthField(
                      controller: _emailController,
                      labelText: l10n.email,
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 16),
                    // Password TextFormField
                    AuthField(
                      controller: _passwordController,
                      labelText: l10n.password,
                      icon: Icons.lock,
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
                              color: Colors.white),
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


/*

*/