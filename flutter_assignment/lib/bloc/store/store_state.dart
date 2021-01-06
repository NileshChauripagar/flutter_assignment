import 'package:equatable/equatable.dart';

abstract class StoreState extends Equatable {
  StoreState([List props = const []]) : super();
}

///Loading Store state
class StoreStateLoading extends StoreState {
  @override
  List<Object> get props => null;
}

///Loaded Store state
class StoreStateLoaded extends StoreState {
  @override
  List<Object> get props => null;
}

///Initial state for Store bloc
class StoreStateInitial extends StoreState {
  @override
  List<Object> get props => null;
}
