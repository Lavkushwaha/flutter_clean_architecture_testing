// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:json_placeholder_tdd2/src/features/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.postId, required super.id, required super.name, required super.email, required super.body});

  // FROM JSON
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  // TO JSON
  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };

  // TO ENTITY
  UserEntity toEntity() => UserEntity(postId: postId, id: id, name: name, email: email, body: body);
}
