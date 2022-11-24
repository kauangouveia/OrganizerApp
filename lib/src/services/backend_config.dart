import 'package:dio/dio.dart';

class Backend {
  static Backend? _instance;

  late Dio io;
  late String token;

  factory Backend.instance() {
    _instance ??= Backend._ctor();
    return _instance!;
  }

  Backend._ctor() {
    io = Dio();
  }

  static Map<String, String> addToken(String token) => {
    'Authorization': token,
  };

  void deleteToken() {
    io.options.headers.remove("Authorization");
  }
}
