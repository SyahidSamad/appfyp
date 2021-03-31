import 'package:flutter/material.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;

class CacheService {
  static Future cacheUpdate({@required String key, @required data}) async {
    await cache.remember(key, data);
  }
}
