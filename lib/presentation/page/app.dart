import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';

import 'package:snip_and_style/config/router/app_route.dart';
import 'package:snip_and_style/config/theme/color_scheme.dart';
import 'package:snip_and_style/config/theme/text_theme.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      ensureScreenSize: true,
      child: MaterialApp.router(
        theme: ThemeData(
          colorScheme: TempChatColorScheme.colorScheme,
          textTheme: TempChatTextTheme.textTheme,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
