import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snip_and_style/config/gen/assets.gen.dart';
import 'package:snip_and_style/config/l10n/l10n.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late final l10n = context.l10n;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 48,
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
                const SizedBox(
                  height: 32,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 48.0),
                      child: Image.asset(Assets.images.welcomeMessage.path),
                    ),
                    SvgPicture.asset(Assets.images.human.path),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  l10n.companyCommunicationTool,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 72,
                  width: 72,
                  margin: const EdgeInsets.symmetric(vertical: 64),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
