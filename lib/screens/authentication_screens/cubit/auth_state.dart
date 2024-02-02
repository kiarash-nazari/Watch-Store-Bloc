part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SentSucsessState extends AuthState {
  final String mobile;
  SentSucsessState({required this.mobile});
}

final class LoadingState extends AuthState {}

final class ErrorState extends AuthState {}

final class LoggedInState extends AuthState {}

final class LoggedOutState extends AuthState {}

final class RegesteredState extends AuthState {}

final class UnRegesteredState extends AuthState {}
