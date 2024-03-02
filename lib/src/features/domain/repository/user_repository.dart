import 'package:dartz/dartz.dart';
import 'package:json_placeholder_tdd2/src/core/failures/failure.dart';
import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers();
}
