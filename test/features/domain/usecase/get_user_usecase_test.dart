// USECASE DEPENDS ON REPOSITORY SO NEED TO MOCK REPOSITORY

// TEST SCENARIOS
// 1. GIVEN Usersusecase WHEN execute is called THEN return Right(List<Entity>)
// 1. GIVEN Usersusecase WHEN execute is called THEN return Left(Failure)

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_tdd2/src/core/failures/failure.dart';
import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';
import 'package:json_placeholder_tdd2/src/features/domain/usecase/get_user_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/users_data/users_dummy_data.dart';
import '../../../test_helpers/helper.mocks.dart';

void main() {
  late MockUserRepository mockUserRepository;
  late GetUsersUsecase getUsersUsecase;

  final List<UserEntity> testUserEntityList = dummyUserEntityList;
  const Failure testFailure = dummyServerFailure;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUsersUsecase = GetUsersUsecase(mockUserRepository);
  });

  group('get user use case testing', () {
    test('GIVEN Usersusecase WHEN execute is called THEN return Right(List<Entity>)', () async {
      // ARRANGE
      when(mockUserRepository.getUsers()).thenAnswer((_) async => Right(testUserEntityList));
      // ACT
      final res = await getUsersUsecase.execute();

      // ASSERT
      expect(res, Right(testUserEntityList));
    });

    test('GIVEN Usersusecase WHEN execute is called THEN return Left(Failure)', () async {
      // ARRANGE
      when(mockUserRepository.getUsers()).thenAnswer((_) async => const Left(testFailure));
      // ACT
      final res = await getUsersUsecase.execute();

      // ASSERT
      expect(res, const Left(testFailure));
    });
  });
}
