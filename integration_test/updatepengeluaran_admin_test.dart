import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:redlenshoescleaning/view/admin/dashboardadmin.dart';
import 'package:redlenshoescleaning/view/admin/pengeluaran/pengeluaran.dart';
import 'package:redlenshoescleaning/view/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'Update Pengeluaran Admin Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).first, 'admin@admin.com');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).last, '123456');
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.byType(ElevatedButton));
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
      await tester.tap(find.widgetWithIcon(IconButton, Icons.more_vert).first);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Icons.calendar_today));
      await tester.pumpAndSettle();
      await tester.tap(find.text('22'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).at(1), 'Sikat');
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField).last, '100000');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await tester.tap(find.text('Ubah'));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 5));
    },
  );
}
