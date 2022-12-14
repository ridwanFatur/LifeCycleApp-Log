import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:my_lifecycleapp/core/hive/hive_key.dart';
import 'package:my_lifecycleapp/data/data_sources/life_cycle_local_data_source.dart';
import '../presentation/first_screen/first_screen_notifier.dart';
import '../presentation/second_screen/second_screen_notifier.dart';
import 'data/repositories/life_cycle_repository_impl.dart';
import 'domain/repositories/life_cycle_repository.dart';
import 'domain/usecases/life_cycle/push_new_life_cycle.dart';
import 'domain/usecases/life_cycle/update_item_life_cycle.dart';
import 'domain/usecases/life_cycle/get_item_life_cycle.dart';
import 'domain/usecases/life_cycle/delete_all_item_life_cycle.dart';
import 'domain/usecases/life_cycle/get_list_life_cycle.dart';

import 'presentation/global_states/main_global_notifier.dart';
import 'package:dio/dio.dart';
import 'core/interceptor/dio_interceptor.dart';

final locator = GetIt.instance;

void init() {
  // notifier
  locator.registerFactory(() => FirstScreenNotifier(
        locator(),
        locator(),
        locator(),
      ));
  locator.registerFactory(() => SecondScreenNotifier());

  // global notifier
  locator.registerFactory(() => MainGlobalNotifier());

  // usecase
  locator.registerLazySingleton(() => PushNewLifeCycle(locator()));
  locator.registerLazySingleton(() => UpdateItemLifeCycle(locator()));
  locator.registerLazySingleton(() => GetItemLifeCycle(locator()));
  locator.registerLazySingleton(() => DeleteAllItemLifeCycle(locator()));
  locator.registerLazySingleton(() => GetListLifeCycle(locator()));

  // repository
  locator.registerLazySingleton<LifeCycleRepository>(
      () => LifeCycleRepositoryImpl(locator()));

  // data source
  locator.registerLazySingleton<LifeCycleLocalDataSource>(
      () => LifeCycleLocalDataSourceImpl(locator()));

  // external
  final Dio dio = Dio();
  dio.interceptors.add(DioInterceptors(dio));

  locator.registerLazySingleton(() => dio);
  locator.registerLazySingleton<Box<dynamic>>(
      () => Hive.box(HiveKey.lifeCycleList));
}
