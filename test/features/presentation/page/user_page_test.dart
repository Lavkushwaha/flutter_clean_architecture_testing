// UI OR PAGE DEPENDS ON BLOC SO NEED TO MOCK BLOC HERE
// WILL NEED A TESTING WIDGET AS WELL FOR PROVIDING BLOC

// TEST SCENARIOS
// 1. GIVEN userPage WHEN bloc return initial state THEN render initial Widget
// 2. GIVEN userPage WHEN bloc return  Loading state THEN render loading Widget
// 3. GIVEN userPage WHEN bloc return loadded state THEN render data loaded Widget
// 4. GIVEN userPage WHEN bloc return error state THEN render Error widget

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';
import 'package:json_placeholder_tdd2/src/features/presentation/bloc/bloc/user_bloc.dart';
import 'package:json_placeholder_tdd2/src/features/presentation/page/user_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../dummy_data/users_data/users_dummy_data.dart';
import '../../../test_helpers/page_keys/user_page.dart';
// import 'package:mocktail/mocktail.dart';

// import '../../../test_helpers/helper.mocks.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  late UserBloc mockUserBloc;
  final List<UserEntity> testUserEntityList = dummyUserEntityList;
  const String testErrorMessage = dummyErrorMessage;

  setUp(() {
    mockUserBloc = MockUserBloc();
  });

  Widget createTestingWidget(Widget child) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => mockUserBloc,
          ),
        ],
        child: child,
      ),
    );
  }

  group('user page ui testing', () {
    testWidgets('GIVEN userPage WHEN bloc return initial state THEN render initial Widget', (widgetTester) async {
      // ARRANGE
      when(() => mockUserBloc.state).thenAnswer((invocation) => UserInitialState());
      await widgetTester.pumpWidget(createTestingWidget(const UserPage()));
      // ACT

      // ASSERT
      final res = find.byKey(userInitialKey);
      expect(res, findsOneWidget);
    });

    testWidgets('GIVEN userPage WHEN bloc return  Loading state THEN render loading Widget', (widgetTester) async {
      // ARRANGE
      when(() => mockUserBloc.state).thenAnswer((invocation) => UserLoadingState());
      await widgetTester.pumpWidget(createTestingWidget(const UserPage()));
      // ACT

      // ASSERT
      final res = find.byKey(userLoadingKey);
      expect(res, findsOneWidget);
    });

    testWidgets('GIVEN userPage WHEN bloc return loadded state THEN render data loaded Widget', (widgetTester) async {
      // ARRANGE
      when(() => mockUserBloc.state).thenAnswer((invocation) => UserLoadedState(testUserEntityList));
      await widgetTester.pumpWidget(createTestingWidget(const UserPage()));
      // ACT

      // ASSERT
      final res = find.byKey(userLoadedDataKey);
      expect(res, findsOneWidget);
    });

    testWidgets('GIVEN userPage WHEN bloc return error state THEN render Error widget', (widgetTester) async {
      // ARRANGE
      when(() => mockUserBloc.state).thenAnswer((invocation) => const UserErrorState(testErrorMessage));
      await widgetTester.pumpWidget(createTestingWidget(const UserPage()));
      // ACT

      // ASSERT
      final res = find.byKey(userErrorKey);
      expect(res, findsOneWidget);
      expect(find.text(testErrorMessage), findsOneWidget);
    });
  });
}
