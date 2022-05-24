part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({this.apiState, this.password, this.email});

  final ApiState? apiState;
  final String? password;
  final String? email;

  @override
  List<Object?> get props => [apiState, password, email];

  AuthState copyWith(ApiState? apiState, {String? password, String? email}) =>
      AuthState(
        apiState: apiState,
        password: password ?? this.password,
        email: email ?? this.email,
      );
}
