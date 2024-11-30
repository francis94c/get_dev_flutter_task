part of 'crypto_bloc.dart';

@freezed
class CryptoEvent with _$CryptoEvent {
  const factory CryptoEvent() = _CryptoEvent;
  const factory CryptoEvent.initialized() = _Initialized;
}
