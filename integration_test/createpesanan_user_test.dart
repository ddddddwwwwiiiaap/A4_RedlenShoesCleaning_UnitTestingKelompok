import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:redlenshoescleaning/view/user/createpesanan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    'Test create pesanan widget',
    (WidgetTester tester) async {
      final listViewKey = Key('your_listview_key');
      await tester.pumpWidget(
        MaterialApp(
          home: CreatePesanan(key: listViewKey),
        ),
      );
      await tester.tap(find.byIcon(Icons.calendar_today));
      await tester.pumpAndSettle();
      await tester.tap(find.text('15'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).at(1), 'John Doe');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).at(2), '1234567890');
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).at(3), 'Nike');
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('dropdown')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Treatment Lama'));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.drag(find.byKey(listViewKey), const Offset(0.0, -500));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      final addButton = find.text('Tambah Pesanan');
      expect(addButton, findsOneWidget);
      await tester.tap(addButton);
      await tester.pumpAndSettle();
    },
  );
}
