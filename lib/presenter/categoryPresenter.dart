import 'dart:developer';

import 'package:appfyp/enum.dart';
import 'package:appfyp/model/categorymodel.dart';
import 'package:appfyp/presenter/basePresenter.dart';
import 'package:appfyp/services/cacheService.dart';

class CategoryPresenter extends BasePresenter {
  List<CategoryModel> categories = [];
  List<Map> categoriesToCache = [];
  Future getCategory() async {
    setViewState(ViewState.BUSY);
    await CacheService.readCache(key: 'categories').then((_categories) {
      print('From cache: $_categories');
      if (_categories != null) {
        _categories.forEach((category) {
          categories.add(CategoryModel(category));
        });
      }
    });
    setViewState(ViewState.IDLE);
  }

  Future createCategory({Map data}) async {
    setViewState(ViewState.BUSY);
    categoriesToCache.add(data);
    print(categoriesToCache);
    await CacheService.insertData(
        key: 'categories', dataToCache: categoriesToCache);

    //print('results from insert data $result');
    setViewState(ViewState.IDLE);
    //return result;
  }
}
