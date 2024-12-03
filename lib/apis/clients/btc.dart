import 'package:get_dev_flutter_task/apis/models/btc/btc_block.dart';
import 'package:get_dev_flutter_task/apis/models/btc/latest_btc_block.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'btc.g.dart';

@RestApi(baseUrl: 'https://blockchain.info/')
abstract class BTCClient {
  factory BTCClient(Dio dio, {String? baseUrl}) = _BTCClient;

  @GET('latestblock')
  Future<LatestBTCBlock> getLatestBtcBlock();

  @GET('rawblock/{block_hash}')
  Future<BTCBlock> getBlockDetails(@Path('block_hash') String blockHash);
}
