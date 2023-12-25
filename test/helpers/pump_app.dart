import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snip_and_style/config/extensions/build_context_extension.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: widget,
      ),
    );
  }
}
