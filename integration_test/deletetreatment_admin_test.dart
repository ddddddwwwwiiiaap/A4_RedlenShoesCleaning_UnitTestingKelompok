import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:redlenshoescleaning/view/loginpage.dart';
import 'package:redlenshoescleaning/view/admin/dashboardadmin.dart';
import 'package:redlenshoescleaning/view/admin/treatment/treatment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'Integration Test',
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
      await tester.pump();
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
      await tester.tap(find.widgetWithIcon(IconButton, Icons.delete).first);
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      expect(find.text('Konfirmasi Penghapusan'), findsOneWidget);
      await tester.tap(find.text('Hapus'));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 3));
      expect(find.byType(Treatment), findsOneWidget);
      expect(find.text('NamaTreatmentYangDihapus'), findsNothing);
    },
  );
}
