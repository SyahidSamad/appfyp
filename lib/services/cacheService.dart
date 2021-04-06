import 'package:flutter/material.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;

class CacheService {
  static Future insertData({@required String key, @required data}) async {
    try {
      var checkdata = await cache.load(key);
      print('Checkdata :$checkdata');
      if (checkdata != null) {
        return false;
      }
      print('After if check');
      await cache
          .write(key, data, 10000000)
          .then((value) => print(value))
          .catchError((e) {
        print('Error when write cache : $e');
      });

      return true;
    } catch (e) {}
  }

  static Future updateCache({@required String key, @required data}) async {
    try {
      //* Add guard to check
      return await cache.load(key);
    } catch (e) {
      print('Error remember cache');
    }
  }

  static Future readCache({@required String key}) async {
    try {
      return await cache.load(key);
    } catch (e) {
      print('Error read cache ${e.toString()}');
    }
  }

  static void deleteCache({@required String key}) async {
    try {
      cache.destroy(key);
    } catch (e) {
      print('Error delete cache');
    }
  }
}
