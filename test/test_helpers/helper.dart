// WILL CREATE MOCK HELPER FROM MOCKITO

import 'package:http/http.dart' as http;
import 'package:json_placeholder_tdd2/src/features/data/datasource/remote_user_datasource.dart';
import 'package:json_placeholder_tdd2/src/features/domain/repository/user_repository.dart';
import 'package:json_placeholder_tdd2/src/features/domain/usecase/get_user_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([UserRepository, UserDataSource, GetUsersUsecase],
    customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {}
