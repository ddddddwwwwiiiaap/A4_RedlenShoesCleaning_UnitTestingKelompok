import 'package:flutter_test/flutter_test.dart';
import 'package:redlenshoescleaning/model/pesananmodel.dart';

void main() {
  group('PesananModel', () {
    test('should create a valid PesananModel from a map', () {
      // arrange
      final map = <String, dynamic>{
        'id': '1',
        'selectedDate': '2023-11-16',
        'namapemilik': 'Budi',
        'notelepon': '08123456789',
        'sepatu': 'Nike',
        'harga': '150000',
        'status': 'pending',
        'listitem': 'Facial, Deep Clean',
      };
      // act
      final result = PesananModel.fromMap(map);
      // assert
      expect(result, isA<PesananModel>());
      expect(result.id, '1');
      expect(result.selectedDate, '2023-11-16');
      expect(result.namapemilik, 'Budi');
      expect(result.notelepon, '08123456789');
      expect(result.sepatu, 'Nike');
      expect(result.harga, '150000');
      expect(result.status, 'pending');
      expect(result.listitem, 'Facial, Deep Clean');
    });

    test('should return a map containing the proper data', () {
      // arrange
      final model = PesananModel(
        id: '1',
        selectedDate: '2023-11-16',
        namapemilik: 'Budi',
        notelepon: '08123456789',
        sepatu: 'Nike',
        harga: '150000',
        status: 'pending',
        listitem: 'Facial, Deep Clean',
      );
      // act
      final result = model.toMap();
      // assert
      final expectedMap = <String, dynamic>{
        'id': '1',
        'selectedDate': '2023-11-16',
        'namapemilik': 'Budi',
        'notelepon': '08123456789',
        'sepatu': 'Nike',
        'harga': '150000',
        'status': 'pending',
        'listitem': 'Facial, Deep Clean',
      };
      expect(result, expectedMap);
    });

    test('should return a JSON string containing the proper data', () {
      // arrange
      final model = PesananModel(
        id: '1',
        selectedDate: '2023-11-16',
        namapemilik: 'Budi',
        notelepon: '08123456789',
        sepatu: 'Nike',
        harga: '150000',
        status: 'pending',
        listitem: 'Facial, Deep Clean',
      );
      // act
      final result = model.toJson();
      // assert
      final expectedJson =
          '{"id":"1","selectedDate":"2023-11-16","namapemilik":"Budi","notelepon":"08123456789","sepatu":"Nike","harga":"150000","status":"pending","listitem":"Facial, Deep Clean"}';
      expect(result, expectedJson);
    });

    test('should create a valid PesananModel from a JSON string', () {
      // arrange
      final json =
          '{"id":"1","selectedDate":"2023-11-16","namapemilik":"Budi","notelepon":"08123456789","sepatu":"Nike","harga":"150000","status":"pending","listitem":"Facial, Deep Clean"}';
      // act
      final result = PesananModel.fromJson(json);
      // assert
      expect(result, isA<PesananModel>());
      expect(result.id, '1');
      expect(result.selectedDate, '2023-11-16');
      expect(result.namapemilik, 'Budi');
      expect(result.notelepon, '08123456789');
      expect(result.sepatu, 'Nike');
      expect(result.harga, '150000');
      expect(result.status, 'pending');
      expect(result.listitem, 'Facial, Deep Clean');
    });
  });
}
