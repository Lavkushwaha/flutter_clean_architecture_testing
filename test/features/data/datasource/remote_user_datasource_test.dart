// DATASOURCE DEPENDS ON HTTP CLIENT SO NEED TO MOCK HTTP CLIENT

// TEST SCENARIOS
// 1. GIVEN userDataSource WHEN getUsers called THEN if response code 200 return List<UserModel>
// 2. GIVEN userDataSource WHEN getUsers called THEN if response code not 200 throw Exception

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:json_placeholder_tdd2/src/constants/constants.dart';
import 'package:json_placeholder_tdd2/src/core/exceptions/app_exceptions.dart';
import 'package:json_placeholder_tdd2/src/features/data/datasource/remote_user_datasource.dart';
import 'package:json_placeholder_tdd2/src/features/data/model/user_model.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/users_data/users_dummy_data.dart';
import '../../../test_helpers/helper.mocks.dart';

void main() {
  late RemoteUserDataSource remoteUserDataSource;
  late MockHttpClient mockHttpClient;

  final List<UserModel> tempUserModelList = dummyUserModelList;
  final ServerException tempServerException = dummyServerException;

  const testjsonResponse = dummyListUserModelJson;
  const String testErrorMessage = dummyErrorMessage;

  final Uri url = Uri.parse(baseUrl + userPath);

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteUserDataSource = RemoteUserDataSource(mockHttpClient);
  });

  group('Remote User data source testing', () {
    test('GIVEN userDataSource WHEN getUsers called THEN if response code 200 return List<UserModel>', () async {
      // ARRANGE
      when(mockHttpClient.get(url)).thenAnswer((realInvocation) async => http.Response(testjsonResponse, 200));
      // ACT
      final res = await remoteUserDataSource.getUsers();
      // ASSERT
      expect(res, tempUserModelList);
    });

    test('GIVEN userDataSource WHEN getUsers called THEN if response code not 200 throw Exception', () async {
      // ARRANGE
      when(mockHttpClient.get(url)).thenAnswer((realInvocation) async => http.Response(testErrorMessage, 404));
      // ACT
      Object? res;

      try {
        res = await remoteUserDataSource.getUsers();
      } catch (e) {
        res = e;
      }

      // ASSERT
      // expect(res, throwsA(isA<ServerException>()));
      expect(res, isA<ServerException>());
    });
  });
}
