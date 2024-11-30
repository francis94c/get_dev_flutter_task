import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_dev_flutter_task/services/auth.dart';
import 'package:email_validator/email_validator.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc([super.initialState = const AuthState()]) {
    on<_Initialized>(_initialized);
    on<_Authenticated>(_authenticated);
    on<_Authenticate>(_authenticate);
    on<_EmailChanged>(_emailChanged);
    on<_PasswordChanged>(_passwordChanged);
    on<_AuthenticationFailed>(_authenticationFailed);

    add(const _Initialized());
  }

  void _initialized(_Initialized event, Emitter<AuthState> emit) async {
    if (await AuthService().isAuthenticated()) {}
  }

  void _passwordChanged(_PasswordChanged event, Emitter<AuthState> emit) {
    final password = PasswordFormz.dirty(event.password ?? "");
    emit(state.copyWith(
      password:
          password.valid ? password : PasswordFormz.pure(event.password ?? ""),
      status: Formz.validate([state.email, password]),
    ));
  }

  void _authenticated(_Authenticated event, Emitter<AuthState> emit) async {}

  void _authenticate(_Authenticate event, Emitter<AuthState> emit) async {}

  void _authenticationFailed(
      _AuthenticationFailed event, Emitter<AuthState> emit) {
    emit(state.copyWith(status: FormzStatus.submissionFailure));
  }

  void _emailChanged(_EmailChanged event, Emitter<AuthState> emit) {
    final email = EmailFormz.dirty(event.email ?? "");
    emit(state.copyWith(
      email: email.valid ? email : EmailFormz.pure(event.email ?? ""),
      status: Formz.validate([email, state.password]),
    ));
  }
}
