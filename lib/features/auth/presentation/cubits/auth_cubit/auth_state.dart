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

final class ObsecureTextToggled extends AuthState {}

final class SendVerificationCodeLoading extends AuthState {}

final class SendVerificationCodeSuccess extends AuthState {}

final class SendVerificationCodeFailed extends AuthState {
  final String errMessage;
  SendVerificationCodeFailed({required this.errMessage});
}

final class EmailVerifiedLoading extends AuthState {}

final class EmailVerifiedSuccess extends AuthState {}

final class EmailVerifiedFailed extends AuthState {
  final String errMessage;
  EmailVerifiedFailed({required this.errMessage});
}
