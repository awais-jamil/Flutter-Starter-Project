part of 'landing_bloc.dart';

class LandingState extends Equatable {
  const LandingState({this.apiState});

  final ApiState? apiState;
  @override
  List<Object?> get props => [apiState];

  LandingState copyWith(ApiState? apiState,
          {String? password, String? email}) =>
      LandingState(
        apiState: apiState,
      );
}
