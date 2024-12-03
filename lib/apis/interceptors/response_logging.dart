import 'package:dio/dio.dart';
import 'package:get_dev_flutter_task/helpers/logging_helper.dart';

class ResponseLoggingInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    logInfo({
      "type": "Request--->",
      "url": options.uri.toString(),
      "method": options.method,
      "payload": options.data,
    });
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logInfo({
      "type": "Response<---",
      "url": response.realUri.toString(),
      "response": response.data,
    });
    handler.next(response);
  }
}
