import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:redlenshoescleaning/view/loginpage.dart';
import 'package:redlenshoescleaning/view/user/dashboarduser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'View Status Pesanan User Test',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );
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
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.text('Pesanan Pending'));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Pesanan On Process'));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Pesanan Selesai'));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.logout));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 5));
      expect(find.byType(LoginPage), findsOneWidget);
      await Future.delayed(const Duration(seconds: 5));
    },
  );
}
