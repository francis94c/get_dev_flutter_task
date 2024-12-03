import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:get_dev_flutter_task/apis/clients/btc.dart';
import 'package:get_dev_flutter_task/apis/interceptors/response_logging.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // HTTP Clients.
  Dio dio = Dio(BaseOptions());
  if (kDebugMode) {
    dio.interceptors.add(ResponseLoggingInterceptor());
  }

  if (kDebugMode) {
    locator.registerFactory<BTCClient>(() => BTCClient(dio));
  } else {
    locator.registerSingleton<BTCClient>(BTCClient(dio));
  }
}
