import 'package:json_annotation/json_annotation.dart';

part 'btc_block_transaction_input.g.dart';

@JsonSerializable()
class BTCBlockTransactionInput {
  int? sequence;
  String? witness;
  String? script;
  int? index;

  BTCBlockTransactionInput();

  factory BTCBlockTransactionInput.fromJson(Map<String, dynamic> json) =>
      _$BTCBlockTransactionInputFromJson(json);

  Map<String, dynamic> toJson() => _$BTCBlockTransactionInputToJson(this);
}
