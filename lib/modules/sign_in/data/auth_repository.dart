import 'package:mobile_app/core/services/api_service.dart';
import 'package:mobile_app/core/services/preferences_service.dart';

abstract class AuthRepository {
  // Future<UserData> signIn(String email, String password);
  Future<void> logout();
}

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.apiService, this.sharedPreferences);

  final ApiService apiService;
  final PreferencesService sharedPreferences;

  // @override
  // Future<UserData> signIn(String email, String password) async {
  //   // final response = await apiService.signIn(
  //   //   SignInRequest(
  //   //     login: Login(email: email.toLowerCase(), password: password),
  //   //   ),
  //   // );
  //   // sharedPreferences.setToken(response.data.token);
  //   // return response.data;
  // }

  @override
  Future<void> logout() => sharedPreferences.clearToken();
}
