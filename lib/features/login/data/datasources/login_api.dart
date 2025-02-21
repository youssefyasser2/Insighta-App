import 'package:dio/dio.dart';
import 'package:insighta/core/constants/const_values.dart';

class LoginApi {
  final Dio dio;

  LoginApi() : dio = Dio();

  Future<Response> login({
    required String email,
    required String password,
  }) async {
    try {
      final String url = '${ApiConstants.baseUrl}/login';
      print("🔵 Sending login request to: $url");
      print("📩 Request Data: {email: $email, password: $password}");

      final response = await dio.post(
        url,
        data: {'email': email, 'password': password},
      );

      print("🟢 Response Status Code: ${response.statusCode}");
      print("🟢 Response Data: ${response.data}");

      return response;
    } catch (e) {
      print("🔴 Login failed with error: $e");
      throw Exception('Login failed: $e');
    }
  }
}
