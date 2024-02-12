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

final class RegisterLoadingState extends RegisterState {}

final class RegisterOkResponseState extends RegisterState {}

final class RegisterPickedLocationState extends RegisterState {
  final GeoPoint geoPoint;
  const RegisterPickedLocationState(this.geoPoint);
  @override
  List<Object> get props => [geoPoint];
}

final class RegisterSubmitErrorState extends RegisterState {}
