import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class SocketFailure extends Failure {
  const SocketFailure(super.message);

  @override
  List<Object?> get props => [message];
}
