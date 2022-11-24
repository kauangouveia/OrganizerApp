import 'package:dio/dio.dart';
import 'package:organizer_app/src/models/task/task_model.dart';
import 'package:organizer_app/src/services/backend_config.dart';
import 'package:organizer_app/src/services/backend_routes.dart';
import 'package:organizer_app/src/services/storage.dart';

class TaskRepository {
  final Backend _backend = Backend.instance();

  Response? response;

  Map<String, String> addToken(String? token) => {
        'Authorization': 'Bearer $token',
      };

  Future<bool> createTask(TaskModel task) async {
    final String token = await Storage.getString('access-token');

    try {
      response = await _backend.io.post(
        API.createTask,
        data: task.toJson(),
        options: Options(
          headers: addToken(token),
        ),
      );

      return response!.statusCode == 200;
    } on DioError catch (e) {
      return throw Exception(e);
    }
  }

  Future listTasks() async {
    final String token = await Storage.getString('access-token');

    try {
      response = await _backend.io.get(
        API.tasks,
        options: Options(
          headers: addToken(token),
        ),
      );

      return response!;
    } on DioError catch (e) {
      return throw Exception(e);
    }
  }
}
