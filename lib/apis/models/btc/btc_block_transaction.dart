import 'package:get_dev_flutter_task/apis/models/btc/btc_block_transaction_input.dart';
import 'package:get_dev_flutter_task/apis/models/btc/btc_block_transaction_output.dart';
import 'package:json_annotation/json_annotation.dart';

part 'btc_block_transaction.g.dart';

@JsonSerializable()
class BTCBlockTransaction {
  String? hash;
  int? ver;
  int? size;

  List<BTCBlockTransactionInput>? inputs;
  List<BTCBlockTransactionOutput>? out;

  BTCBlockTransaction();

  factory BTCBlockTransaction.fromJson(Map<String, dynamic> json) =>
      _$BTCBlockTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$BTCBlockTransactionToJson(this);
}
