import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_dev_flutter_task/apis/clients/btc.dart';
import 'package:get_dev_flutter_task/apis/models/btc/btc_block.dart';
import 'package:get_dev_flutter_task/apis/models/btc/btc_block_transaction.dart';
import 'package:get_dev_flutter_task/helpers/logging_helper.dart';
import 'package:get_dev_flutter_task/service_locator.dart';

part 'crypto_state.dart';
part 'crypto_event.dart';
part 'crypto_bloc.freezed.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc([super.initialState = const CryptoState()]) {
    on<_Initialized>(_onInitialized);
    on<_FetchBTCTransactions>(_onFetchBTCTransactions);
    on<_FetchTezosTransactions>(_onFetchTezosTransactions);
    on<_Error>(_onError);
  }

  void _onInitialized(_Initialized event, Emitter<CryptoState> emit) {}

  void _onFetchBTCTransactions(
      _FetchBTCTransactions event, Emitter<CryptoState> emit) async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final latestBloc = await locator<BTCClient>().getLatestBtcBlock();
      final block =
          await locator<BTCClient>().getBlockDetails(latestBloc.hash!);
      emit(state.copyWith(
        btcBlock: block,
        status: FormzStatus.submissionSuccess,
      ));
    } catch (e, trace) {
      logError(e, trace);
      add(const _Error('Something went wrong'));
    }
  }

  void _onFetchTezosTransactions(
      _FetchTezosTransactions event, Emitter<CryptoState> emit) {}

  void _onError(_Error event, Emitter<CryptoState> emit) {
    emit(state.copyWith(errorMessage: event.message));
  }
}
