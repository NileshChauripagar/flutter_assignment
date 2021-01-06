import 'package:equatable/equatable.dart';

abstract class StoreEvent extends Equatable {
  StoreEvent([List props = const []]) : super();
}

///Fetch all store data
class FetchAllDataStoreEvent extends StoreEvent {
  @override
  List<Object> get props => null;
}
