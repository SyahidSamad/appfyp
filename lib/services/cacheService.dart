import 'package:appfyp/model/categorymodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;

class CacheService {
  static Future insertData(
      {@required String key, @required dataToCache}) async {
    try {
      var datas = await cache.load(key);

      if (datas is List<dynamic>) {
        print('Old data: $datas');
        datas.forEach((element) {
          dataToCache.add(element);
        });
      }
      print('NewData :$dataToCache');
      print('After if check');
      return await cache
          .write(key, dataToCache)
          .then((value) => print('Value after sucessful cache: $value'))
          .catchError((e) {
        print('Error when write cache : $e');
      });
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
