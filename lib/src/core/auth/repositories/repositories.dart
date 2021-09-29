import 'package:base_flutter/src/utils/services/secure_storage_service.dart';
import 'package:dio/dio.dart';

class UserRepository {
  static String mainUrl = "https://todo.368up.com";
  var loginUrl = '$mainUrl/api/TokenAuth/Authenticate';

  final Dio _dio = Dio();

  Future<bool> hasToken() async => await SecureStorage.hasToken();

  Future<void> persistToken(String token) async {
    await SecureStorage.persistToken(token);
  }

  Future<void> deleteToken() async {
        await SecureStorage.deleteToken();
  }

  Future<String> login(String email, String password) async {
    _dio.options.headers['content-type'] = 'application/json';
    _dio.options.headers["Abp.TenantId"] = "2";
    _dio.options.headers["X-Requested-With"] = "XMLHttpRequest";
    Response response = await _dio.post(loginUrl, data: {
      "usernameOrEmailAddress": email,
      "password": password,
    });
    return response.data["result"]["accessToken"];
  }

}