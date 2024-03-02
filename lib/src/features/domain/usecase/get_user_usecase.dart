import 'package:dartz/dartz.dart';
import 'package:json_placeholder_tdd2/src/core/failures/failure.dart';
import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';
import 'package:json_placeholder_tdd2/src/features/domain/repository/user_repository.dart';

class GetUsersUsecase {
  final UserRepository _userRepository;
  GetUsersUsecase(this._userRepository);

  Future<Either<Failure, List<UserEntity>>> execute() async {
    return _userRepository.getUsers();
  }
}
