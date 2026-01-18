import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TestAssetBundle extends CachingAssetBundle {
  static final Uint8List _transparentImage = base64Decode(
    'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR4nGNgYAAAAAMA'
    'ASsJTYQAAAAASUVORK5CYII=',
  );

  @override
  Future<ByteData> load(String key) async {
    return ByteData.view(_transparentImage.buffer);
  }
}

Widget buildTestApp({
  required Widget child,
  Map<String, WidgetBuilder>? routes,
  GoRouter? router,
  List<Override>? overrides,
}) {
  final app = router == null
      ? MaterialApp(
          home: child,
          routes: routes ?? const <String, WidgetBuilder>{},
        )
      : MaterialApp.router(routerConfig: router);

  return DefaultAssetBundle(
    bundle: TestAssetBundle(),
    child: ProviderScope(
      overrides: overrides ?? const [],
      child: app,
    ),
  );
}
