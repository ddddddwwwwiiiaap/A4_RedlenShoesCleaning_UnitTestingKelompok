import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:redlenshoescleaning/main.dart' as app;
import 'package:redlenshoescleaning/view/user/dashboarduser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'View Detail Pesanan User Test',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).first, 'teama4@gmail.com');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).last, '123456');
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 5));
      expect(find.byType(DashboardUser), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.longPress(find.byType(Card).first);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
    },
  );
}
