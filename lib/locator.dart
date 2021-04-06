import 'package:appfyp/presenter/categoryPresenter.dart';
import 'package:appfyp/presenter/itemPresenter.dart';
import 'package:appfyp/services/cacheService.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => CategoryPresenter());
  locator.registerFactory(() => ItemPresenter());
  locator.registerLazySingleton(() => CacheService());
}
