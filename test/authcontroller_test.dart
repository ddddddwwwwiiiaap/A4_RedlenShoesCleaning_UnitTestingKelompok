import 'package:flutter_test/flutter_test.dart';
import 'package:redlenshoescleaning/controller/authcontroller.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:redlenshoescleaning/model/usermodel.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late AuthController authController;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    final auth = MockFirebaseAuth();
    authController = AuthController(auth, fakeFirestore.collection('user'));
  });

  group('AuthController Tests', () {
    test('Register with Email and Password Test', () async {
      final user = await authController.registerWithEmailAndPassword(
        'a4team@gmail.com',
        'password',
        'Test User',
      );

      expect(user, isNotNull);
      expect(user!.email, 'a4team@gmail.com');
      expect(user.name, 'Test User');
      expect(user.uId.isNotEmpty, true);

      final savedUserSnapshot =
          await fakeFirestore.collection('user').doc(user.uId).get();
      expect(savedUserSnapshot.exists, true);

    });

    test('Sign In with Incorrect Credentials Test', () async {
      final wrongCredentials = await authController.signInWithEmailAndPassword(
        'nonexistent@example.com', // Non-existent user
        'wrongpassword',
      );

      expect(wrongCredentials, isNull);
    });

    test('Sign Out Test', () async {
      await authController.signOut();
      final currentUser = authController.getCurrentUser();

      expect(currentUser, isNull);
    });

    test('Sign In with Email and Password Test', () async {
      // Tambahkan pengguna baru untuk pengujian login
      await authController.registerWithEmailAndPassword(
        'a4_team@gmail.com',
        'password',
        'Login User',
      );

      final loggedInUser = await authController.signInWithEmailAndPassword(
        'a4_team@gmail.com',
        'password',
      );

      expect(loggedInUser, isNotNull);
      expect(loggedInUser!.email, 'a4_team@gmail.com');
      expect(loggedInUser.name, 'Login User');
      expect(loggedInUser.uId.isNotEmpty, true);
    });

    test('Get Current User Test', () {
      final currentUser = authController.getCurrentUser();

      // Pastikan pengguna saat ini tidak ada karena belum ada yang masuk
      expect(currentUser, isNull);
    });
  });
}