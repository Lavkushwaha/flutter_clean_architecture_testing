import 'package:dartz/dartz.dart';
import 'package:json_placeholder_tdd2/src/core/exceptions/app_exceptions.dart';
import 'package:json_placeholder_tdd2/src/core/failures/failure.dart';
import 'package:json_placeholder_tdd2/src/features/data/datasource/remote_user_datasource.dart';
import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';
import 'package:json_placeholder_tdd2/src/features/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSource _userDataSource;
  UserRepositoryImpl(this._userDataSource);

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    try {
      final res = await _userDataSource.getUsers();
      final resEntity = res.map((e) => e.toEntity()).toList();
      return Right(resEntity);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    } catch (e) {
      return const Left(ServerFailure('some erro'));
    }
  }
}
