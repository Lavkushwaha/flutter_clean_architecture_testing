import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:json_placeholder_tdd2/src/features/data/datasource/remote_user_datasource.dart';
import 'package:json_placeholder_tdd2/src/features/data/repository/user_repository_impl.dart';
import 'package:json_placeholder_tdd2/src/features/domain/repository/user_repository.dart';
import 'package:json_placeholder_tdd2/src/features/domain/usecase/get_user_usecase.dart';
import 'package:json_placeholder_tdd2/src/features/presentation/bloc/bloc/user_bloc.dart';
import 'package:json_placeholder_tdd2/src/services/logger_service.dart';

final getIt = GetIt.instance;

void setupInjection() {
  // REPOSITORY
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt()));

  // DATASOURCE
  getIt.registerLazySingleton<UserDataSource>(() => RemoteUserDataSource(getIt()));

  // USECASE
  getIt.registerLazySingleton<GetUsersUsecase>(() => GetUsersUsecase(getIt()));

  // BLOC
  getIt.registerFactory<UserBloc>(() => UserBloc(getIt()));

  // HTTP
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // SERVICES
  getIt.registerLazySingleton<LoggerService>(() => LoggerService());
}
