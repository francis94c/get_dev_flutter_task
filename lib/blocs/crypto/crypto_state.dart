part of 'crypto_bloc.dart';

@freezed
class CryptoState with _$CryptoState {
  const CryptoState._();
  const factory CryptoState([
    String? token,
  ]) = _CryptoState;
}
