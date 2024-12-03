part of 'crypto_bloc.dart';

@freezed
class CryptoState with _$CryptoState {
  const CryptoState._();
  const factory CryptoState([
    BTCBlock? btcBlock,
    @Default(FormzStatus.pure) FormzStatus status,
    String? errorMessage,
    BTCBlockTransaction? selectedBtcBlockTransaction,
  ]) = _CryptoState;
}
