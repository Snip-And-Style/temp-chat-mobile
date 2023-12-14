import 'package:auto_route/auto_route.dart';
import 'package:snip_and_style/presentation/page/login/login_page.dart';
import 'package:snip_and_style/presentation/page/register/register_page.dart';
import 'package:snip_and_style/presentation/page/welcome/welcome_page.dart';

part 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: WelcomeRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: RegisterRoute.page,
        ),
      ];
}
