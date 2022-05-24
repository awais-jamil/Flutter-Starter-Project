import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mobile_app/core/services/api_state.dart';
import 'package:mobile_app/modules/sign_in/data/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(const AuthState()) {
    hydrate();
    on<SigninEvent>(_signIn);
    on<LogoutEvent>(_logout);
  }
  final AuthRepository authRepository;

  Future<void> _signIn(SigninEvent event, Emitter emit) async {
    // emit(state.copyWith(ApiLoadingState()));
    // final apiState = await apiCall<UserData>(
    //   () => authRepository.signIn(event.email, event.password),
    // );
    // emit(
    //   state.copyWith(
    //     apiState,
    //     password: event.password,
    //     email: event.email,
    //   ),
    // );
  }

  Future<void> _logout(LogoutEvent event, Emitter emit) async {
    emit(state.copyWith(ApiLoadingState()));
    await authRepository.logout();
    clear();
    emit(const AuthState());
  }

  @override
  AuthState? fromJson(Map<String, dynamic>? json) {
    // return json == null ? null : AuthState.fromJson(json);
    return null;
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    // return state.toJson();
    return null;
  }
}
