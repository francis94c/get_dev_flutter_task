part of 'crypto_bloc.dart';

@freezed
class CryptoEvent with _$CryptoEvent {
  const factory CryptoEvent() = _CryptoEvent;
  const factory CryptoEvent.initialized() = _Initialized;
  const factory CryptoEvent.fetchBTCTransactions() = _FetchBTCTransactions;
  const factory CryptoEvent.fetchTezosTransactions() = _FetchTezosTransactions;
  const factory CryptoEvent.error(String? message) = _Error;
  const factory CryptoEvent.selectBtcBlockTransaction(
      BTCBlockTransaction btcBlockTransaction) = _SelectBtcBlockTransaction;
}
