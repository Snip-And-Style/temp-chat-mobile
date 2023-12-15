import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:snip_and_style/backbone/dependency_injection.dart';
import 'package:snip_and_style/config/l10n/l10n.dart';
import 'package:snip_and_style/config/router/app_route.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: getIt<ValueNotifier<GraphQLClient>>(),
      child: MaterialApp.router(
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
            onSurface: Color(0xff0B0B0C),
          ),
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
