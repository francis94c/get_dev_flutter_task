part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState([
    String? token,
    String? errorMessage,
    String? resetPasswordToken,
    @Default(true) bool obscureNewPassword,
    @Default(true) bool obscureNewPasswordConfirm,
    @Default(false) bool refreshedUser,
    @Default(PasswordFormz.pure()) PasswordFormz password,
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(FormzStatus.pure) FormzStatus status,
  ]) = _AuthState;
}

enum ForgotPasswordStage { one, two, three }

//==============================================================================
// FORMZ
//==============================================================================

enum ValidationError { invalid, short }

//==============================================================================
// FORMZ - PASSWORD
//==============================================================================

class PasswordFormz extends FormzInput<String, ValidationError> {
  const PasswordFormz.pure([super.value = '']) : super.pure();
  const PasswordFormz.dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationError.invalid;
    }

    return null;
  }
}

//==============================================================================
// FORMZ - EMAIL
//==============================================================================

class EmailFormz extends FormzInput<String, ValidationError> {
  const EmailFormz.pure([super.value = '']) : super.pure();
  const EmailFormz.dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty || !EmailValidator.validate(value)) {
      return ValidationError.invalid;
    }

    return null;
  }
}
