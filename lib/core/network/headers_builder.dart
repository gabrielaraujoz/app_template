import 'package:app_template/core/meta_info/meta_info.dart';
import 'package:injectable/injectable.dart';

@injectable
class HeadersBuilder {
  final MetaInfo _metaInfo;

  const HeadersBuilder(
    this._metaInfo,
  );

  Future<Map<String, String>> getFullHeaders() async {
    final resultMap = <String, String>{};
    final appVersion = await _metaInfo.appVersionName;
    final platform = _metaInfo.platform;
    final timezone = await _metaInfo.timezone;

    resultMap['X-User-Agent'] = 'App/$platform/$appVersion';
    resultMap['Time-Zone'] = timezone;
    resultMap['Accept'] = 'application/json';

    return resultMap;
  }
}
