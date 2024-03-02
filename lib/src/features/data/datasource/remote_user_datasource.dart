import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_placeholder_tdd2/src/constants/constants.dart';
import 'package:json_placeholder_tdd2/src/core/exceptions/app_exceptions.dart';
import 'package:json_placeholder_tdd2/src/features/data/model/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getUsers();
}

class RemoteUserDataSource extends UserDataSource {
  final http.Client _client;
  final Uri url = Uri.parse(baseUrl + userPath);

  RemoteUserDataSource(this._client);
  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final res = await _client.get(url);
      if (res.statusCode == 200) {
        return List.from(json.decode(res.body)).map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw ServerException(serverErrorMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
