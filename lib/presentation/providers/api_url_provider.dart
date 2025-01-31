import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_url_provider.g.dart';

@Riverpod(keepAlive: true)
class ApiUrl extends _$ApiUrl {
  @override
  String build() {
    return '';
  }

  void updateUrl(String newUrl) {
    state = newUrl;
  }
}
