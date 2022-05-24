import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/core/services/api_state.dart';
import 'package:mobile_app/modules/landing/data/landing_repository.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class AuthBloc extends Bloc<BaseLandingEvent, LandingState> {
  AuthBloc(this.repository) : super(const LandingState()) {
    on<LandingEvent>(_someAction);
  }
  final LandingRepository repository;

  Future<void> _someAction(LandingEvent event, Emitter emit) async {
    // emit(state.copyWith(ApiLoadingState()));
    // final apiState = await apiCall<ResponseModel>(
    //   () => repository.signIn(event.email, event.password),
    // );
    // emit(
    //   state.copyWith(
    //     apiState,
    //     password: event.password,
    //     email: event.email,
    //   ),
    // );
  }
}
