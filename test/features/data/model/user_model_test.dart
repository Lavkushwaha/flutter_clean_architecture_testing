// MODEL DEPENDS ON ENTITY BUT NO NEED TO MOCK ANYTHING

// TEST SCENARIOS
//  GIVEN WHEN  THEN
// 1. Model should be subclass of Entity
// 2. GIVEN userModelJson WHEN fromJson method callaed THEN return UserModel
// 3. GIVEN userModel WHEN toJson method callaed THEN return UserModel Map

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_tdd2/src/features/data/model/user_model.dart';
import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';

import '../../../dummy_data/users_data/users_dummy_data.dart';

void main() {
  final UserModel testUserModel = dummyUserModel;
  const userModelJson = dummyUserModelJson;

  group('User Model Test Case', () {
    test('Model should be subclass of Entity', () {
      // ARRANGE
      // ACT
      // ASSERT
      expect(testUserModel, isA<UserEntity>());
    });

    test('GIVEN userModelJson WHEN fromJson method callaed THEN return UserModel', () {
      // ARRANGE
      // ACT
      final res = UserModel.fromJson(json.decode(userModelJson));
      // ASSERT
      expect(res, equals(testUserModel));
    });

    test('GIVEN userModel WHEN toJson method callaed THEN return UserModel Map', () {
      // ARRANGE
      // ACT
      final res = testUserModel.toJson();
      // ASSERT
      expect(res, equals(json.decode(userModelJson)));
    });
  });
}
