part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class Registersuccess extends AuthState {}

final class RegisterFailed extends AuthState {
  final String message;

  RegisterFailed({required this.message});
}
