part of 'auth_cubit.dart';

@immutable
sealed class AuthState extends Equatable {}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

final class SentSucsessState extends AuthState {
  final String mobile;
  SentSucsessState({required this.mobile});

  @override
  List<Object?> get props => [];
}

final class LoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

final class ErrorState extends AuthState {
  @override
  List<Object?> get props => [];
}

final class LoggedInState extends AuthState {
  @override
  List<Object?> get props => [];
}

final class LoggedOutState extends AuthState {
  @override
  List<Object?> get props => [];
}

final class RegesteredState extends AuthState {
  @override
  List<Object?> get props => [];
}

final class UnRegesteredState extends AuthState {
  @override
  List<Object?> get props => [];
}

final class ReSetTimerState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthTimerUpdated extends AuthState {
  final int newTimerValue;

  AuthTimerUpdated(this.newTimerValue);

  @override
  List<Object?> get props => [newTimerValue];
}
