import '../usecases/life_cycle/push_new_life_cycle.dart';
import '../usecases/life_cycle/update_item_life_cycle.dart';
import '../usecases/life_cycle/get_item_life_cycle.dart';
import '../usecases/life_cycle/delete_all_item_life_cycle.dart';
import '../usecases/life_cycle/get_list_life_cycle.dart';

abstract class LifeCycleRepository {
  bool pushNewLifeCycle(PushNewLifeCycleParams params);
  bool updateItemLifeCycle(UpdateItemLifeCycleParams params);
  String? getItemLifeCycle(GetItemLifeCycleParams params);
  bool deleteAllItemLifeCycle(DeleteAllItemLifeCycleParams params);
  List<String> getListLifeCycle(GetListLifeCycleParams params);
}
