import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:redlenshoescleaning/view/admin/dashboardadmin.dart';
import 'package:redlenshoescleaning/view/admin/pengeluaran/createpengeluaran.dart';
import 'package:redlenshoescleaning/view/admin/pengeluaran/pengeluaran.dart';
import 'package:redlenshoescleaning/view/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'Test create pengeluaran widget',
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
      await tester.tap(find.byIcon(Icons.trending_down_sharp));
      await tester.pumpAndSettle();
      expect(find.byType(Pengeluaran), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      expect(find.byType(CreatePengeluaran), findsOneWidget);
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Icons.calendar_today));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.tap(find.text('15'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).at(1), 'Sepatu');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).last, '250000');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();
      expect(find.text('Sepatu'), findsOneWidget);
      expect(find.text('250000'), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 2));
    },
  );
}
