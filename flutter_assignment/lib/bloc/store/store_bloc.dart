import 'package:flutterassignment/bloc/store/store_event.dart';
import 'package:flutterassignment/bloc/store/store_repository.dart';
import 'package:flutterassignment/bloc/store/store_state.dart';
import 'package:flutterassignment/model/store_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreRepository storeRepository;

  StoreBloc({@required this.storeRepository}) : super(null);

  List<Result> _storeData = List();

  List<Result> get storeData {
    return _storeData;
  }

  @override
  StoreState get initialState => StoreStateInitial();

  @override
  Stream<StoreState> mapEventToState(StoreEvent event) async* {
    if (event is FetchAllDataStoreEvent) {
      yield* _mapFetchAllDataStoreEventToState(event);
    }
  }

  ///fetch all store data
  Stream<StoreState> _mapFetchAllDataStoreEventToState(
      FetchAllDataStoreEvent event) async* {
    try {
      yield StoreStateLoading();
      _storeData = await storeRepository.fetchStoreData();
      yield StoreStateLoaded();
    } catch (err) {
      Fluttertoast.showToast(
          msg: '${err.toString()}', gravity: ToastGravity.CENTER);
    }
  }
}
