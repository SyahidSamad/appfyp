import 'package:appfyp/enum.dart';
import 'package:appfyp/model/itemmodel.dart';
import 'package:appfyp/presenter/basePresenter.dart';
import 'package:appfyp/services/cacheService.dart';
import 'package:flutter/material.dart';

class ItemPresenter extends BasePresenter {
  List<ItemModel> listOfItemModel = [];
  var _listOfItemFromCache, _categoryFromCache;
  String categoryName, _categoryNameFromCache;

  Future getItem({@required int index}) async {
    setViewState(ViewState.BUSY);
    await CacheService.readCache(key: 'categories').then((categories) {
      if (categories == null) {
        return;
      }
      _categoryFromCache = categories[index];
      _listOfItemFromCache = _categoryFromCache['listOfItem'];
      _categoryNameFromCache = _categoryFromCache['categoryName'];

      print('Category from cache : $_categoryFromCache');

      print('Category Name from cache : $_categoryNameFromCache');

      print('Category list from cache : $_listOfItemFromCache');
      if (_categoryNameFromCache != null) {
        categoryName = _categoryNameFromCache;
      }
      if (_listOfItemFromCache != null) {
        _listOfItemFromCache.forEach((itemFromCache) {
          listOfItemModel.add(ItemModel(itemFromCache));
        });
      }
    });

    setViewState(ViewState.IDLE);
  }
}
