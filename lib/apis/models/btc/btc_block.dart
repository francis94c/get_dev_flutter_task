import 'package:get_dev_flutter_task/apis/models/btc/btc_block_transaction.dart';
import 'package:json_annotation/json_annotation.dart';

part 'btc_block.g.dart';

@JsonSerializable()
class BTCBlock {
  String? hash;
  int? time;
  int? size;

  List<BTCBlockTransaction>? tx;

  BTCBlock();

  factory BTCBlock.fromJson(Map<String, dynamic> json) =>
      _$BTCBlockFromJson(json);

  Map<String, dynamic> toJson() => _$BTCBlockToJson(this);
}
