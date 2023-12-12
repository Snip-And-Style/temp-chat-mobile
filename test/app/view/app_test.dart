import 'package:flutter_test/flutter_test.dart';
import 'package:snip_and_style/presentation/page/app.dart';
import 'package:snip_and_style/presentation/page/welcome/welcome_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(WelcomePage), findsOneWidget);
    });
  });
}
