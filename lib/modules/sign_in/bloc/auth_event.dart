part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class SigninEvent extends AuthEvent {
  SigninEvent({required this.email, required this.password}) : super();

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class LogoutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
