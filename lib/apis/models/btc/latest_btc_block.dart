import 'package:json_annotation/json_annotation.dart';

part 'latest_btc_block.g.dart';

@JsonSerializable()
class LatestBTCBlock {
  String? hash;
  int? time;
  int? height;

  @JsonKey(name: 'block_index')
  int? blockIndex;

  @JsonKey(name: 'txIndexes')
  List<int>? txIndexes;

  LatestBTCBlock();

  factory LatestBTCBlock.fromJson(Map<String, dynamic> json) =>
      _$LatestBTCBlockFromJson(json);

  Map<String, dynamic> toJson() => _$LatestBTCBlockToJson(this);
}
