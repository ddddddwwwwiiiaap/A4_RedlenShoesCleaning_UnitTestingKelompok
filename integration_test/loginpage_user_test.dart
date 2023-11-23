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
    'Login Test',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).first, 'teama4@gmail.com');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).last, '123456');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.byType(DashboardUser), findsOneWidget);
    },
  );
}
