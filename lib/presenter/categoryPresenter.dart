import 'package:appfyp/enum.dart';
import 'package:appfyp/presenter/basePresenter.dart';
import 'package:appfyp/services/cacheService.dart';

class CategoryPresenter extends BasePresenter {
  Future getCategory() async {
    setViewState(ViewState.BUSY);
    CacheService.getUpdated(key: 'categories');
  }
}
