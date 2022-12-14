import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_lifecycleapp/core/error/failure.dart';
import 'package:my_lifecycleapp/core/types/network_result.dart';
import 'package:my_lifecycleapp/domain/usecases/life_cycle/delete_all_item_life_cycle.dart';
import 'package:my_lifecycleapp/domain/usecases/life_cycle/get_list_life_cycle.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:my_lifecycleapp/domain/usecases/life_cycle/push_new_life_cycle.dart';
import 'package:my_lifecycleapp/presentation/global_widgets/show_toast.dart';

class FirstScreenNotifier extends ChangeNotifier {
  // Notifier State
  bool _isDisposed = false;

  // Usecase
  final GetListLifeCycle _getListLifeCycle;
  final PushNewLifeCycle _pushNewLifeCycle;
  final DeleteAllItemLifeCycle _deleteAllItemLifeCycle;
  FirstScreenNotifier(this._getListLifeCycle, this._pushNewLifeCycle,
      this._deleteAllItemLifeCycle);

  // State
  NetworkResult<List<String>> networkResult = ResultEmpty();

  // Notifier Method
  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  void safeNotifyListeners() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  void initState() {
    loadAllData();
  }

  // Method
  void deleteAllItem() {
    dartz.Either<Failure, bool> result =
        _deleteAllItemLifeCycle.call(const DeleteAllItemLifeCycleParams());
    result.fold(
      (failure) {
        debugPrint(failure.message);
      },
      (data) {
        debugPrint(data.toString());
      },
    );
  }

  void loadAllData() {
    dartz.Either<Failure, List<String>> result =
        _getListLifeCycle.call(GetListLifeCycleParams());

    result.fold(
      (failure) {
        showToast(failure.message);
      },
      (data) {
        networkResult = ResultHasData(data);
        safeNotifyListeners();
      },
    );
  }

  void addData(AppLifecycleState state) {
    String typeLifeCycle = "";
    switch (state) {
      case AppLifecycleState.resumed:
        typeLifeCycle = "resumed";
        break;
      case AppLifecycleState.inactive:
        typeLifeCycle = "inactive";
        break;
      case AppLifecycleState.paused:
        typeLifeCycle = "paused";
        break;
      case AppLifecycleState.detached:
        typeLifeCycle = "detached";
        break;
    }

    String dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    String lifeCycleFormat = "$typeLifeCycle | $dateTime";
    dartz.Either<Failure, bool> result =
        _pushNewLifeCycle.call(PushNewLifeCycleParams(data: lifeCycleFormat));
    result.fold(
      (failure) {
        debugPrint(failure.message);
      },
      (data) {
        debugPrint(data.toString());
      },
    );
  }
}
