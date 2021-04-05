import 'package:flutter/material.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;

class CacheService {
  static Future insertData({@required String key, @required data}) async {
    try {
      var checkdata = await cache.load(key);
      if (checkdata != null) {
        return false;
      }
      await cache.write(key, data);
      return true;
    } catch (e) {}
  }

  static Future cacheUpdate({@required String key, @required data}) async {
    try {
      //* Add guard to check
      return await cache.load(key);
    } catch (e) {
      print('Error remember cache');
    }
  }

  static Future getUpdated({@required String key}) async {
    return await cache.load(key);
  }
}
