import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snip_and_style/backbone/dependency_injection.dart';
import 'package:snip_and_style/backbone/extensions/build_context_extension.dart';
import 'package:snip_and_style/backbone/gen/assets.gen.dart';
import 'package:snip_and_style/backbone/router/app_route.dart';
import 'package:snip_and_style/presentation/page/welcome/bloc/welcome_bloc.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final l10n = context.l10n;
  final WelcomeBloc welcomeBloc = getIt.get<WelcomeBloc>();

  @override
  void initState() {
    welcomeBloc.add(const WelcomeEvent.started());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 24.h,
            horizontal: 48.w,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  l10n.customerChatPlugin,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 48.h),
                      child: Image.asset(Assets.images.welcomeMessage.path),
                    ),
                    SvgPicture.asset(Assets.images.human.path),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  l10n.companyCommunicationTool,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: 16.h,
                ),
                BlocSelector<WelcomeBloc, WelcomeState, bool>(
                  bloc: welcomeBloc,
                  selector: (state) {
                    return state.isAuthorized;
                  },
                  builder: (context, isAuthorized) {
                    return InkWell(
                      onTap: () {
                        isAuthorized
                            ? context.router.push(const MessagesRoute())
                            : context.router.push(const LoginRoute());
                      },
                      child: Container(
                        height: 72.h,
                        width: 72.w,
                        margin: EdgeInsets.symmetric(vertical: 64.h),
                        decoration: BoxDecoration(
                          color: const Color(0xff374ACB),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              // blurRadius: 16,
                              offset: const Offset(-16, 0),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
