import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:redlenshoescleaning/view/admin/dashboardadmin.dart';
import 'package:redlenshoescleaning/view/admin/treatment/treatment.dart';
import 'package:redlenshoescleaning/view/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'Update Treatment Widget Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byKey(const Key('emailField')), 'admin@admin.com');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byKey(const Key('passwordField')), '123456');
      await tester.tap(find.byKey(const Key('login')));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 3));
      expect(find.byType(DashboardAdmin), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byType(DashboardAdmin));
      await tester.pumpAndSettle();
      expect(find.byType(DashboardAdmin), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Icons.analytics_sharp));
      await tester.pumpAndSettle();
      expect(find.byType(Treatment), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.widgetWithIcon(IconButton, Icons.edit).first);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      await tester.enterText(find.byType(TextFormField).at(0), 'Treatment Lama');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).last, '10000');
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      await tester.tap(find.text('Ubah'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
    },
  );
}
