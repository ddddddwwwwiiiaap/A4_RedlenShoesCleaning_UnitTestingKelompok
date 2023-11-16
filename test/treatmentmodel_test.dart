import 'package:flutter_test/flutter_test.dart';
import 'package:redlenshoescleaning/model/treatmentmodel.dart';

void main() {
  group('TreatmentModel', () {
    test('should create a valid TreatmentModel from a map', () {
      // arrange
      final map = <String, dynamic>{
        'id': '1',
        'jenistreatment': 'Facial',
        'harga': '100000',
      };
      // act
      final result = TreatmentModel.fromMap(map);
      // assert
      expect(result, isA<TreatmentModel>());
      expect(result.id, '1');
      expect(result.jenistreatment, 'Facial');
      expect(result.harga, '100000');
    });

    test('should return a map containing the proper data', () {
      // arrange
      final model = TreatmentModel(
        id: '1',
        jenistreatment: 'Facial',
        harga: '100000',
      );
      // act
      final result = model.toMap();
      // assert
      final expectedMap = <String, dynamic>{
        'id': '1',
        'jenistreatment': 'Facial',
        'harga': '100000',
      };
      expect(result, expectedMap);
    });

    test('should return a JSON string containing the proper data', () {
      // arrange
      final model = TreatmentModel(
        id: '1',
        jenistreatment: 'Facial',
        harga: '100000',
      );
      // act
      final result = model.toJson();
      // assert
      final expectedJson =
          '{"id":"1","jenistreatment":"Facial","harga":"100000"}';
      expect(result, expectedJson);
    });

    test('should create a valid TreatmentModel from a JSON string', () {
      // arrange
      final json = '{"id":"1","jenistreatment":"Facial","harga":"100000"}';
      // act
      final result = TreatmentModel.fromJson(json);
      // assert
      expect(result, isA<TreatmentModel>());
      expect(result.id, '1');
      expect(result.jenistreatment, 'Facial');
      expect(result.harga, '100000');
    });
  });
}
