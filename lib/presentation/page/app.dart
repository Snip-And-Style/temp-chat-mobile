import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';

import 'package:snip_and_style/config/router/app_route.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff374ACB),
          onPrimary: Color(0xff060606),
          secondary: Color(0xffC8DDF6),
          onSecondary: Color(0xff0B0B0C),
          error: Color(0xffBF2828),
          onError: Color(0xff0B0B0C),
          background: Color(0xffF8F9FB),
          onBackground: Color(0xff0B0B0C),
          surface: Color(0xffE7ECF2),
          onSurface: Color(0xff555555),
          outlineVariant: Color(0xff2488E7),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: const Color(0xff060606),
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 36,
          ),
          headlineMedium: TextStyle(
            color: const Color(0xff060606),
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 32,
          ),
          headlineSmall: TextStyle(
            color: const Color(0xff060606),
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
          bodyLarge: TextStyle(
            color: const Color(0xff060606),
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
            color: const Color(0xff060606),
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          bodySmall: TextStyle(
            color: const Color(0xff060606),
            fontFamily: GoogleFonts.lato().fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _appRouter.config(),
    );
  }
}
