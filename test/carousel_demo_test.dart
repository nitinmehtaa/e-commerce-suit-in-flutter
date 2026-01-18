import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_tablayout/config/app_config.dart';

void main() {
  test('Hero image list has entries', () {
    final config = AppConfig.quickCommerce();
    expect(config.assets.heroImageUrls, isNotEmpty);
    expect(config.assets.heroImageUrls.first, contains('https://'));
  });
}
