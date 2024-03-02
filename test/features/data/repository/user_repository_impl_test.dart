  // REPOSITORY DEPENDS ON DATA SOURCE THEN NEED TO MOCK DATASOURCE


  // TEST SCENARIOS
  // 1. GIVEN user repsitory WHEN getUser fucntion called THEN return Right<List<UserEntity>>
  // 2. GIVEN user repsitory WHEN getUser fucntion called THEN return Left<Failure>

  import 'package:dartz/dartz.dart';
  import 'package:flutter_test/flutter_test.dart';
  import 'package:json_placeholder_tdd2/src/core/failures/failure.dart';
  import 'package:json_placeholder_tdd2/src/features/data/model/user_model.dart';
  import 'package:json_placeholder_tdd2/src/features/data/repository/user_repository_impl.dart';
  import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';
  import 'package:mockito/mockito.dart';

  import '../../../dummy_data/users_data/users_dummy_data.dart';
  import '../../../test_helpers/helper.mocks.dart';

  void main() {
    late UserRepositoryImpl userRepositoryImpl;
    late MockUserDataSource mockUserDataSource;

    final List<UserModel> testUserModelList = dummyUserModelList;

    final List<UserEntity> testUserEntityList = dummyUserEntityList;

    const Failure testFailure = dummyServerFailure;
    const String errorMessage = dummyErrorMessage;
    Exception testServerException = dummyServerException;

    setUp(() {
      mockUserDataSource = MockUserDataSource();
      userRepositoryImpl = UserRepositoryImpl(mockUserDataSource);
    });

    group('user repository testing', () {
      test('GIVEN user repsitory WHEN getUser fucntion called THEN return Right<List<UserEntity>>', () async {
        // ARRANGE
        when(mockUserDataSource.getUsers()).thenAnswer((realInvocation) async => testUserModelList);
        // ACT
        final res = await userRepositoryImpl.getUsers();
        // ASSERT
        // expect(res, Right(testUserEntityList));
        expect(res.isRight(), true);
      });

      test('GIVEN user repsitory WHEN getUser fucntion called THEN return Left<Failure>', () async {
        // ARRANGE
        when(mockUserDataSource.getUsers()).thenThrow(testServerException);
        // ACT
        final res = await userRepositoryImpl.getUsers();
        // ASSERT
        // expect(res, Right(testUserEntityList));
        expect(res, const Left(testFailure));
      });
    });
  }
