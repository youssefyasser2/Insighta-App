import '../datasources/login_api.dart';

class LoginRepository {
  final LoginApi loginApi;

  LoginRepository({required this.loginApi});

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await loginApi.login(email: email, password: password);

    if (response.statusCode == 200) {
      final responseData = response.data;

      // Check if the response contains an error message
      if (responseData.containsKey('error')) {
        throw Exception(
          responseData['error'],
        ); // Throw error if API returns an error message
      }

      return responseData;
    } else {
      throw Exception('Invalid email or password');
    }
  }
}
