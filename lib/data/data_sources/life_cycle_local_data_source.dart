import '../../core/error/exceptions.dart';
import 'package:hive/hive.dart';
import '../../core/constants/warning_message.dart';
import '../../domain/usecases/life_cycle/push_new_life_cycle.dart';
import '../models/response/life_cycle/push_new_life_cycle_response.dart';
import '../../domain/usecases/life_cycle/update_item_life_cycle.dart';
import '../models/response/life_cycle/update_item_life_cycle_response.dart';
import '../../domain/usecases/life_cycle/get_item_life_cycle.dart';
import '../models/response/life_cycle/get_item_life_cycle_response.dart';
import '../../domain/usecases/life_cycle/delete_all_item_life_cycle.dart';
import '../models/response/life_cycle/delete_all_item_life_cycle_response.dart';
import '../../domain/usecases/life_cycle/get_list_life_cycle.dart';
import '../models/response/life_cycle/get_list_life_cycle_response.dart';

abstract class LifeCycleLocalDataSource {
  PushNewLifeCycleResponse pushNewLifeCycle(PushNewLifeCycleParams params);
  UpdateItemLifeCycleResponse updateItemLifeCycle(
      UpdateItemLifeCycleParams params);
  GetItemLifeCycleResponse getItemLifeCycle(GetItemLifeCycleParams params);
  DeleteAllItemLifeCycleResponse deleteAllItemLifeCycle(
      DeleteAllItemLifeCycleParams params);
  GetListLifeCycleResponse getListLifeCycle(GetListLifeCycleParams params);
}

class LifeCycleLocalDataSourceImpl implements LifeCycleLocalDataSource {
  final Box<dynamic> _box;
  LifeCycleLocalDataSourceImpl(this._box);

  @override
  PushNewLifeCycleResponse pushNewLifeCycle(PushNewLifeCycleParams params) {
    try {
      _box.add(params.data);
      return const PushNewLifeCycleResponse(status: true);
    } catch (e) {
      throw ServerExceptions(WarningMessage.somethingWentWrong);
    }
  }

  @override
  UpdateItemLifeCycleResponse updateItemLifeCycle(
      UpdateItemLifeCycleParams params) {
    try {
      _box.putAt(params.index, params.data);
      return const UpdateItemLifeCycleResponse(status: true);
    } catch (e) {
      throw ServerExceptions(WarningMessage.somethingWentWrong);
    }
  }

  @override
  GetItemLifeCycleResponse getItemLifeCycle(GetItemLifeCycleParams params) {
    try {
      final data = _box.getAt(params.index);
      return GetItemLifeCycleResponse(data: data);
    } catch (e) {
      throw ServerExceptions(WarningMessage.somethingWentWrong);
    }
  }

  @override
  DeleteAllItemLifeCycleResponse deleteAllItemLifeCycle(
      DeleteAllItemLifeCycleParams params) {
    try {
      _box.clear();
      return const DeleteAllItemLifeCycleResponse(status: true);
    } catch (e) {
      throw ServerExceptions(WarningMessage.somethingWentWrong);
    }
  }

  @override
  GetListLifeCycleResponse getListLifeCycle(GetListLifeCycleParams params) {
    try {
      List<String> data = [];
      for (final item in _box.values) {
        data.add(item);
      }
      return GetListLifeCycleResponse(data: data);
    } catch (e) {
      throw ServerExceptions(WarningMessage.somethingWentWrong);
    }
  }
}
