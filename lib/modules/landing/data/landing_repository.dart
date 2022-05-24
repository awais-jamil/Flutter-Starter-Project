import 'package:mobile_app/core/services/api_service.dart';
import 'package:mobile_app/core/services/preferences_service.dart';

abstract class LandingRepository {
  // Future<ResponseModel> signIn(String email, String password);
  // Future<void> logout();
}

class LandingRepositoryImpl extends LandingRepository {
  LandingRepositoryImpl(this.apiService, this.sharedPreferences);

  final ApiService apiService;
  final PreferencesService sharedPreferences;
}
