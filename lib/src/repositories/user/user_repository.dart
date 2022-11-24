import 'package:dio/dio.dart';
import 'package:organizer_app/src/models/user/user_model.dart';
import 'package:organizer_app/src/services/backend_config.dart';
import 'package:organizer_app/src/services/backend_routes.dart';

class UserRepository {
  final Backend _backend = Backend.instance();

  Response? response;

  Future<bool> createUser(UserModel user) async {
    try {
      response = await _backend.io.post(
        API.createUser,
        data: user.toJson(),
      );

      return response!.statusCode == 200;
    } on DioError catch (e) {
      return throw Exception(e);
    }
  }

  Future<bool> doUserLogin(UserModel user) async {
    try {
      response = await _backend.io.post(
        API.login,
        data: user.toJsonLogin(),
      );

      return response!.statusCode == 200;
    } on DioError catch (e) {
      return throw Exception(e);
    }
  }
}
