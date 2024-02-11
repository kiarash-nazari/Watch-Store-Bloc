part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingPhotoState extends RegisterState {}

final class RegisterLoadedPhotState extends RegisterState {
  final File photo;

  const RegisterLoadedPhotState(this.photo);

  @override
  List<Object> get props => [photo];
}

final class RegisterCanceledPhotState extends RegisterState {}
