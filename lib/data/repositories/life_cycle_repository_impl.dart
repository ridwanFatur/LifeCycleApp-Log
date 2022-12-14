import '../data_sources/life_cycle_local_data_source.dart';
import '../../domain/repositories/life_cycle_repository.dart';
import '../../domain/usecases/life_cycle/push_new_life_cycle.dart';
import '../../domain/usecases/life_cycle/update_item_life_cycle.dart';
import '../../domain/usecases/life_cycle/get_item_life_cycle.dart';
import '../../domain/usecases/life_cycle/delete_all_item_life_cycle.dart';
import '../../domain/usecases/life_cycle/get_list_life_cycle.dart';

class LifeCycleRepositoryImpl implements LifeCycleRepository {
  final LifeCycleLocalDataSource localDataSource;
  LifeCycleRepositoryImpl(this.localDataSource);

  @override
  bool pushNewLifeCycle(PushNewLifeCycleParams params) {
    final result = localDataSource.pushNewLifeCycle(params);
    return result.status;
  }

  @override
  bool updateItemLifeCycle(UpdateItemLifeCycleParams params) {
    final result = localDataSource.updateItemLifeCycle(params);
    return result.status;
  }

  @override
  String? getItemLifeCycle(GetItemLifeCycleParams params) {
    final result = localDataSource.getItemLifeCycle(params);
    if (result.data != null) {
      return result.data!;
    } else {
      return null;
    }
  }

  @override
  bool deleteAllItemLifeCycle(DeleteAllItemLifeCycleParams params) {
    final result = localDataSource.deleteAllItemLifeCycle(params);
    return result.status;
  }

  @override
  List<String> getListLifeCycle(GetListLifeCycleParams params) {
    final result = localDataSource.getListLifeCycle(params);
    return List<String>.from(result.data.map((e) => e));
  }
}
