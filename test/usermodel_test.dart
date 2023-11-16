import 'package:flutter_test/flutter_test.dart';
import 'package:redlenshoescleaning/model/usermodel.dart';

void main() {
  group('UserModel', () {
    test('should create a valid UserModel from a map', () {
      // arrange
      final map = <String, dynamic>{
        'name': 'A4 Team',
        'email': 'a4team@gmail.com',
        'uId': '123456',
        'role': 'admin',
      };
      // act
      final result = UserModel.fromMap(map);
      // assert
      expect(result, isA<UserModel>());
      expect(result.name, 'A4 Team');
      expect(result.email, 'a4team@gmail.com');
      expect(result.uId, '123456');
      expect(result.role, 'admin');
    });

    test('should return a map containing the proper data', () {
      // arrange
      final model = UserModel(
        name: 'A4 Team',
        email: 'a4team@gmail.com',
        uId: '123456',
        role: 'admin',
      );
      // act
      final result = model.toMap();
      // assert
      final expectedMap = <String, dynamic>{
        'name': 'A4 Team',
        'email': 'a4team@gmail.com',
        'uId': '123456',
        'role': 'admin',
      };
      expect(result, expectedMap);
    });

    test('should return a JSON string containing the proper data', () {
      // arrange
      final model = UserModel(
        name: 'A4 Team',
        email: 'a4team@gmail.com',
        uId: '123456',
        role: 'admin',
      );
      // act
      final result = model.toJson();
      // assert
      final expectedJson =
          '{"name":"A4 Team","email":"a4team@gmail.com","uId":"123456","role":"admin"}';
      expect(result, expectedJson);
    });

    test('should create a valid UserModel from a JSON string', () {
      // arrange
      final json =
          '{"name":"A4 Team","email":"a4team@gmail.com","uId":"123456","role":"admin"}';
      // act
      final result = UserModel.fromJson(json);
      // assert
      expect(result, isA<UserModel>());
      expect(result.name, 'A4 Team');
      expect(result.email, 'a4team@gmail.com');
      expect(result.uId, '123456');
      expect(result.role, 'admin');
    });

    test('should return a new UserModel instance with updated fields', () {
      // arrange
      final model = UserModel(
        name: 'A4 Team',
        email: 'a4team@gmail.com',
        uId: '123456',
        role: 'admin',
      );
      // act
      final result = model.copyWith(
        name: 'STQA Team',
        email: 'stqateam@gmail.com',
        uId: '654321',
        role: 'user',
      );
      // assert
      expect(result, isA<UserModel>());
      expect(result.name, 'STQA Team');
      expect(result.email, 'stqateam@gmail.com');
      expect(result.uId, '654321');
      expect(result.role, 'user');
    });

    test(
        'should override toString and return a proper string representation of the model',
        () {
      // arrange
      final model = UserModel(
        name: 'A4 Team',
        email: 'a4team@gmail.com',
        uId: '123456',
        role: 'admin',
      );
      // act
      final result = model.toString();
      // assert
      final expectedString =
          'UserModel(name: A4 Team, email: a4team@gmail.com, uId: 123456, role: admin)';
      expect(result, expectedString);
    });

    test('should override == operator and return true if two models are equal',
        () {
      // arrange
      final model1 = UserModel(
        name: 'A4 Team',
        email: 'a4team@gmail.com',
        uId: '123456',
        role: 'admin',
      );
      final model2 = UserModel(
        name: 'A4 Team',
        email: 'a4team@gmail.com',
        uId: '123456',
        role: 'admin',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, true);
    });

    test(
        'should override == operator and return false if two models are not equal',
        () {
      // arrange
      final model1 = UserModel(
        name: 'A4 Team',
        email: 'a4team@gmail.com',
        uId: '123456',
        role: 'admin',
      );
      final model2 = UserModel(
        name: 'STQA Team',
        email: 'stqateam@gmail.com',
        uId: '654321',
        role: 'user',
      );
      // act
      final result = model1 == model2;
      // assert
      expect(result, false);
    });

    test('should override hashCode and return a proper hash code', () {
      // arrange
      final model = UserModel(
        name: 'A4 Team',
        email: 'a4team@gmail.com',
        uId: '123456',
        role: 'admin',
      );
      // act
      final result = model.hashCode;
      // assert
      final expectedHashCode = model.name.hashCode ^
          model.email.hashCode ^
          model.uId.hashCode ^
          model.role.hashCode;
      expect(result, expectedHashCode);
    });
  });
}
