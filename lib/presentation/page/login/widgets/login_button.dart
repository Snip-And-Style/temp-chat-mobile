import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snip_and_style/backbone/dependency_injection.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';
import 'package:snip_and_style/presentation/page/login/bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.submit,
  });

  final void Function() submit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: submit,
      child: Container(
        height: 72,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.color.primary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: context.color.surface,
              offset: const Offset(-16, 0),
            ),
          ],
        ),
        child: BlocSelector<LoginBloc, LoginState, LoginState>(
          bloc: getIt.get<LoginBloc>(),
          selector: (state) {
            return state;
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () {
                return Center(
                  child: CircularProgressIndicator(
                    color: context.color.background,
                  ),
                );
              },
              orElse: () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.signIn,
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
