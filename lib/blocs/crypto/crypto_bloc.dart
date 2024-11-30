import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_state.dart';
part 'crypto_event.dart';
part 'crypto_bloc.freezed.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc(super.initialState) {}
}
