import 'package:json_annotation/json_annotation.dart';

part 'btc_block_transaction_output.g.dart';

@JsonSerializable()
class BTCBlockTransactionOutput {
  int? type;
  bool? spent;
  int? value;

  BTCBlockTransactionOutput();

  factory BTCBlockTransactionOutput.fromJson(Map<String, dynamic> json) =>
      _$BTCBlockTransactionOutputFromJson(json);

  Map<String, dynamic> toJson() => _$BTCBlockTransactionOutputToJson(this);
}
