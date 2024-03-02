// BLOC DEPENDS ON USECASE SO NEED TO MOCK USECASE HERE

// TEST SCENARIOS
// 1. GIVE userBloc WHEN no action performed THEN return initial state state
// 2. GIVE userBloc WHEN usecase gets executed THEN change state to loading->loaded state
// 3. GIVE userBloc WHEN usecase gets executed THEN change state to error state

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_tdd2/src/core/failures/failure.dart';
import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';
import 'package:json_placeholder_tdd2/src/features/presentation/bloc/bloc/user_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../../dummy_data/users_data/users_dummy_data.dart';
import '../../../../test_helpers/helper.mocks.dart';

void main() {
  late UserBloc userBloc;
  late MockGetUsersUsecase mockGetUsersUsecase;

  final List<UserEntity> testUserEntityList = dummyUserEntityList;
  const ServerFailure testServerFailure = dummyServerFailure;
  const testFailureErrorMessage = dummyErrorMessage;

  setUp(() {
    mockGetUsersUsecase = MockGetUsersUsecase();
    userBloc = UserBloc(mockGetUsersUsecase);
  });

  group('user bloc test cases', () {
    test('GIVE userBloc WHEN no action performed THEN return initial state state', () {
      // ARRANGE
      // when(mockGetUsersUsecase.execute()).thenAnswer((realInvocation) => )

      // ACT

      // ASSERT
      expect(userBloc.state, UserInitialState());
    });

    blocTest<UserBloc, UserState>(
      'GIVE userBloc WHEN usecase gets executed THEN change state to loading->loaded state',
      build: () {
        when(mockGetUsersUsecase.execute()).thenAnswer((realInvocation) async => Right(testUserEntityList));
        return userBloc;
      },
      act: (bloc) => bloc.add(GetUsersEvent()),
      expect: () => <UserState>[UserLoadingState(), UserLoadedState(testUserEntityList)],
    );

    blocTest<UserBloc, UserState>(
      'GIVE userBloc WHEN usecase gets executed THEN change state to error state',
      build: () {
        when(mockGetUsersUsecase.execute()).thenAnswer((realInvocation) async => const Left(testServerFailure));
        return userBloc;
      },
      act: (bloc) => bloc.add(GetUsersEvent()),
      expect: () => <UserState>[UserLoadingState(), const UserErrorState(testFailureErrorMessage)],
    );
  });
}
