part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();
  const factory AuthEvent() = _AuthEvent;
  const factory AuthEvent.initialized() = _Initialized;
  const factory AuthEvent.authenticated(String token) = _Authenticated;
  const factory AuthEvent.authenticate() = _Authenticate;
  const factory AuthEvent.authenticationFailed(String? message) =
      _AuthenticationFailed;
  const factory AuthEvent.errorMessage(String? message) = _ErrorMessage;
  const factory AuthEvent.emailChanged(String? email) = _EmailChanged;
  const factory AuthEvent.passwordChanged(String? password) = _PasswordChanged;
  const factory AuthEvent.phoneNumberChanged(String? phoneNumber) =
      _PhoneNumberChanged;
  const factory AuthEvent.resetState() = _ResetState;
}
