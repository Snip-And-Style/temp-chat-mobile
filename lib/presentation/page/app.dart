import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';

import 'package:snip_and_style/config/router/app_route.dart';
import 'package:snip_and_style/config/theme/color_scheme.dart';
import 'package:snip_and_style/config/theme/text_theme.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: TempChatColorScheme.colorScheme,
        textTheme: TempChatTextTheme.textTheme,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _appRouter.config(),
    );
  }
}
