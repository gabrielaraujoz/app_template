import 'package:app_template/core/network/headers_builder.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class HeadersInterceptor extends InterceptorsWrapper {
  final HeadersBuilder _headersBuilder;

  HeadersInterceptor(
    this._headersBuilder,
  );

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final headers = await _headersBuilder.getFullHeaders();

    options.headers.addAll(headers);

    return super.onRequest(options, handler);
  }
}
