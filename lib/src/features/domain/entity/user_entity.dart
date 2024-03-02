import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  int postId;
  int id;
  String name;
  String email;
  String body;

  UserEntity({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  List<Object?> get props => [postId, id, name, email, body];
}
