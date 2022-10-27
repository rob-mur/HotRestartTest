import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hot_restart_test/main.dart' as app;

void main() {
  group('end-to-end test', () {
    FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('check flutter driver health', () async {
      Health health = await driver!.checkHealth();
      print(health.status);
    });

    // testWidgets('tap on the floating action button, verify counter',
    //     (tester) async {
    //   app.main();
    //   await tester.pumpAndSettle();
    //
    //   // Verify the counter starts at 0.
    //   expect(find.text('0'), findsOneWidget);
    //
    //   // Finds the floating action button to tap on.
    //   final Finder fab = find.byTooltip('Increment');
    //
    //   // Emulate a tap on the floating action button.
    //   await tester.tap(fab);
    //
    //   // Trigger a frame.
    //   await tester.pumpAndSettle();
    //
    //   // Verify the counter increments by 1.
    //   expect(find.text('1'), findsOneWidget);
    // });

    tearDownAll(() async {
      if (driver != null) {
        await driver!.close();
      }
    });
  });
}
